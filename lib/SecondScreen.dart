// Copyright (c) 2019 Souvik Biswas
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventori/auth/login.dart';
import 'package:inventori/auth/sign_in.dart';
import 'package:inventori/home.dart';

class SecondScreen extends StatelessWidget {
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
              leading: Icon(Icons.category),
              title: Text("Kategori"),
              onTap: () {
                // Change the applications state
                print("Kategori");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("AC"),
              onTap: () {
                // Change the applications state
                print("Change page");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bike),
              title: Text("Bike"),
              onTap: () {
                // Change the applications state
                print("SIlahkan Pindah Halaman");
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
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
            colors: [Colors.teal[600], Colors.teal[300]],
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
