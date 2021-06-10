import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/beranda.dart';
import 'package:inventori/cari.dart';
import 'package:inventori/home.dart';
import 'package:inventori/kategori.dart';

class FormBarang extends StatefulWidget {
  @override
  FormBarangState createState() => FormBarangState();
}

class FormBarangState extends State<FormBarang> {
  final TextEditingController kodeController = TextEditingController();
  final TextEditingController namaBarangController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController kondisiController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  CollectionReference _barang = FirebaseFirestore.instance.collection('barang');
  FirebaseAuth _auth = FirebaseAuth.instance;
  // String dropdownValue = 'Air';
  // bool status = false;

  void clearInputText() {
    kodeController.text = "";
    namaBarangController.text = "";
    jumlahBarangController.text = "";
    kondisiController.text = "";
    kategoriController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barang'),
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
                      MaterialPageRoute(builder: (context) => FormBarang()));
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
                // Kode
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // nama
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: namaBarangController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // jumlah barang
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: jumlahBarangController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah Barang',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),

                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String newValue) {
                //     setState(() {
                //       dropdownValue = newValue;
                //     });
                //   },
                //   items: <String>['One', 'Two', 'Free', 'Four']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),

                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.blueGrey),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.green,
                //   ),
                //   onChanged: (String newValue) {
                //     setState(() {
                //       dropdownValue = newValue;
                //       status = true;
                //     });
                //   },
                //   items: <String>['kecil', 'medium', 'besar']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),

                // kondisi
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: kondisiController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kondisi',
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
                      labelText: 'Kategori',
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
                            await _barang.add({
                              "kode": kodeController.text,
                              "namaBarang": namaBarangController.text,
                              "jumlahBarang":
                                  double.tryParse(jumlahBarangController.text),
                              "kondisi": kondisiController.text,
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
