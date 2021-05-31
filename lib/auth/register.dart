import 'package:flutter/material.dart';
import 'package:inventori/auth/login.dart';
import 'package:inventori/auth/sign_in.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.teal[600],
      ),
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 8, right: 30),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: TextFormField(
                controller: passwordController,
                obscureText: _isHidePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _togglePasswordVisibility();
                    },
                    child: Icon(
                      _isHidePassword ? Icons.visibility_off : Icons.visibility,
                      color: _isHidePassword ? Colors.white : Colors.white,
                    ),
                  ),
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 170),
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
                  onPressed: () async {
                    signUp(emailController.text, passwordController.text,
                            nameController.text)
                        .then(
                      (result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        }
                      },
                    );
                  },
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
