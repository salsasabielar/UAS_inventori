// Copyright (c) 2019 Souvik Biswas
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/beranda.dart';
import 'package:inventori/form/formBarang.dart';
import 'package:inventori/home.dart';
import 'package:inventori/kategori.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                //'LOGIN SUCCESS',
                _auth.currentUser.email,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
