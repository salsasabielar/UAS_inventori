import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/barang.dart';
import 'package:inventori/beranda.dart';
import 'package:inventori/cari.dart';
import 'package:inventori/home.dart';
import 'package:inventori/kategori.dart';

class FormKategori extends StatefulWidget {
  @override
  FormKategoriState createState() => FormKategoriState();
}

class FormKategoriState extends State<FormKategori> {
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
          title: Text('Kategori'),
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
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // Kode Kategori
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // kategori
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: kategoriController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // tombol button
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      // tombol simpan
                      Expanded(
                        child: RaisedButton(
                          color: Colors.teal[600],
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () async {
                            await _kategori.add({
                              "kode": kodeController.text,
                              "kategori": kategoriController.text,
                            });
                            clearInputText();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      // tombol batal
                      Expanded(
                        child: RaisedButton(
                          color: Colors.teal[600],
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Cancel',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
