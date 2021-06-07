//import 'package:firestore_example/contoh_sederhana/item_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/beranda.dart';
import 'package:inventori/cari.dart';
import 'package:inventori/formBarang.dart';
import 'package:inventori/formKategori.dart';
import 'package:inventori/home.dart';
import 'package:inventori/item.dart';
import 'package:inventori/kategori.dart';

class BarangPage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _barang = FirebaseFirestore.instance.collection('barang');

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal[600], Colors.teal[200]],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Colors.teal[500],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormBarang()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add"),
                  )
                ],
              ),
            ),
            // TODO 2 VIEW, update , and delete DATA HERE
            /// hanya get sekali saja jika menggunakan FutureBuilder
            /*
                  FutureBuilder<QuerySnapshot>(
                    future: _pengguna.get(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data!.docs
                            .map((e) =>
                                ItemCard(e.data()['name'], e.data()['age']))
                            .toList(),
                      );
                    },
                  ),
                  */

            // get secara realtime jikga menggunakan stream builder
            StreamBuilder<QuerySnapshot>(
              // contoh penggunaan srteam
              // _pengguna.orderBy('age', descending: true).snapshots()
              // _pengguna.where('age', isLessThan: 30).snapshots()
              stream: _barang.orderBy('kode', descending: false).snapshots(),
              builder: (buildContext, snapshot) {
                return Column(
                  children: snapshot.data.docs
                      .map((e) => ItemCard(
                            e.data()['kode'],
                            e.data()['namaBarang'],
                            e.data()['jumlahBarang'],
                            e.data()['kondisi'],
                            e.data()['kategori'],
                            onUpdate: () {
                              _barang.doc(e.id).update({
                                "jumlahBarang": e.data()['jumlahBarang'] + 1
                              });
                            },
                            onDelete: () {
                              _barang.doc(e.id).delete();
                            },
                          ))
                      .toList(),
                );
              },
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
