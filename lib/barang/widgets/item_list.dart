import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventori/barang/screens/edit_screen.dart';
import 'package:inventori/barang/utils/database.dart';

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
              String namaBarang = noteInfo['namaBarang'];
              int jumlahBarang = noteInfo['jumlahBarang'];
              String kondisi = noteInfo['kondisi'];
              String kategori = noteInfo['kategori'];

              return Card(
                color: Colors.teal[400],
                elevation: 3.0,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentKode: kode,
                        currentNamaBarang: namaBarang,
                        currentJumlahBarang: jumlahBarang,
                        currentKondisi: kondisi,
                        currentKategori: kategori,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text(
                    kode,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Nama Barang : " +
                        namaBarang +
                        "\nJumlah Barang : " +
                        '$jumlahBarang' +
                        " buah" +
                        "\nKondisi : " +
                        kondisi +
                        "\nKategori: " +
                        kategori,
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
