import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smacy/Registratrion.dart';
import 'package:http/http.dart' as http;
import 'package:smacy/VideoPlayer.dart';
import 'package:smacy/home.dart';
import 'main.dart';

class loginform extends StatefulWidget {
  @override
  loginform_ createState() => loginform_();
}

class loginform_ extends State<loginform> {
  final _baseLoginUrl = 'http://127.0.0.1:8000/login/';
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(height: 55),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 300, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetStarted()),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(right: 295),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: SizedBox(
                  width: 340,
                  height: 72,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Email',
                      hintText: 'example@mail.com',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 270),
              child: Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: SizedBox(
                  width: 340,
                  height: 72,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.none,
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Email',
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  )),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 127, 232, 28),
                    elevation: 3,
                    side: BorderSide(width: 1, color: Color.fromARGB(255, 127, 232, 28)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(148, 13, 148, 13)),
                onPressed: () async {
                  if (_emailTextController.text.isEmpty || _passwordTextController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Please fill all the fields'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        });
                  } else {
                    var qureyP = {
                      'email': _emailTextController.text,
                      'password': _passwordTextController.text,
                    };
                    // var stringUri = _baseLoginUrl + '?email=' + _emailTextController.text + '&password=' + _passwordTextController.text;
                    final newUri = Uri.parse(_baseLoginUrl);
                    var response = await http.post(newUri, body: qureyP);
                    print(jsonDecode(response.body).keys.runtimeType);
                    if (response.statusCode == 200) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video()),
                      );
                    } else if (response.statusCode == 400) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Invalid password'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          }));
                    } else if (response.statusCode == 404) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('No email Exist, Please Register'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          }));
                    } else {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Something went wrong'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          }));
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Archivo',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 100),
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Archivo',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromRGBO(11, 26, 13, 1), padding: EdgeInsets.fromLTRB(0, 10, 10, 10)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 127, 232, 28),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ))));
  }
}
