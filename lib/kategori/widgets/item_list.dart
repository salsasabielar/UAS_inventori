import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventori/kategori/screens/edit_screen.dart';
import 'package:inventori/kategori/utils/database.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String kode = noteInfo['kode'];
              String kategori = noteInfo['kategori'];

              return Card(
                color: Colors.teal[400],
                elevation: 3.0,
                // decoration: BoxDecoration(
                //   //color: CustomColors.firebaseGrey.withOpacity(0.1),
                //   borderRadius: BorderRadius.circular(8.0),
                // ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentKode: kode,
                        currentKategori: kategori,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text(
                    kode,
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    kategori,
                    //maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(
              //   CustomColors.firebaseOrange,
              // ),
              ),
        );
      },
    );
  }
}
