import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventori/home.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // MainPage(),
          HomePage(),
      //LoginPage(),
    );
  }
}
