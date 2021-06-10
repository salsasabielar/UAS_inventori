//import 'package:firestore_example/contoh_sederhana/item_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/barang.dart';
import 'package:inventori/beranda.dart';
import 'package:inventori/cari.dart';
import 'package:inventori/form/formKategori.dart';
import 'package:inventori/home.dart';
import 'package:inventori/item2.dart';
import 'package:inventori/kategori/screens/add_screen.dart';
import 'package:inventori/kategori/widgets/item_list.dart';

class KategoriPage extends StatelessWidget {
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController kodeController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _kategori =
      FirebaseFirestore.instance.collection('kategori');

  void clearInputText() {
    kodeController.text = "";
    kategoriController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // ignore: missing_required_param
            UserAccountsDrawerHeader(
              accountEmail: Text(
                _auth.currentUser.email,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.teal[500]
                        : Colors.white,
                child: Icon(
                  Icons.people,
                  color: Colors.teal[500],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.teal[500],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                // Change the applications state
                print("Beranda");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text("Barang"),
              onTap: () {
                // Change the applications state
                print("Barang");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BarangPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Kategori"),
              onTap: () {
                // Change the applications state
                print("Kategori");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KategoriPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Cari"),
              onTap: () {
                // Change the applications state
                print("Cari");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            Divider(
              height: 5.0,
              color: Colors.teal[600],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () {
                signOutEmail();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[500],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        //backgroundColor: CustomColors.firebaseOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      //   body: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(
      //         left: 16.0,
      //         right: 16.0,
      //         bottom: 20.0,
      //       ),
      //       child: ItemList(),
      //     ),
      //   ),
      // );
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal[600], Colors.teal[200]],
          ),
        ),
        // child: ListView(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 15, top: 12),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           FloatingActionButton.extended(
        //             backgroundColor: Colors.teal[500],
        //             onPressed: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => AddScreen()));
        //             },
        //             icon: Icon(Icons.add),
        //             label: Text("Add"),
        //           )
        //         ],
        //       ),
        //     ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: ItemList(),
        ),

        // ],
      ),
      //),
    );
  }
}
