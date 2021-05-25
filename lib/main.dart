import 'package:flutter/material.dart';
import 'package:inventori/auth/login.dart';
import 'package:inventori/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), //LoginPage(),
    );
  }
}
