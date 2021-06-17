import 'package:flutter/material.dart';
import 'package:inventori/auth/login.dart';
import 'package:inventori/auth/register.dart';

class HomePage extends StatefulWidget {
// This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 15),
              child: Container(
                width: double.infinity,
                height: 55,
                child: RaisedButton(
                  color: Colors.teal[600],
                  child: Text(
                    'Sign In',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 70),
              child: Container(
                width: double.infinity,
                height: 55,
                child: RaisedButton(
                  color: Colors.teal[600],
                  child: Text(
                    'Sign Up',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
