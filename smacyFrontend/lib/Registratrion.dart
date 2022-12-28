import 'package:flutter/material.dart';
import 'package:smacy/main.dart';

import 'loginform.dart';

class register extends StatefulWidget {
  

  @override
  register_ createState() => register_();
}

class register_ extends State<register> {
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
          child:IconButton(
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
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.0,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Archivo',
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          padding: EdgeInsets.only(right: 295),
          child: Text(
            'Name',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: SizedBox(
              width: 340,
              height: 72,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //labelText: 'Email',
                  hintText: 'Mike Smith',
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(right: 295),
          child: Text(
            'Email',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: SizedBox(
              width: 340,
              height: 72,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
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
                  hintText: 'Example@mail.com',
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
          ),
        ),
         SizedBox(height: 5),
        Center(
          child: SizedBox(
              width: 340,
              height: 72,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
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
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(right: 215),
          child: Text(
            'Confirm Password',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
          ),
        ),
         SizedBox(height: 5),
        Center(
          child: SizedBox(
              width: 340,
              height: 72,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
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
                  hintText: 'Confirm Password',
                  
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
         
        
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(right: 32),
                child: Text(
                  "By registering, you accept our terms and conditions",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',fontSize: 12.5),
                ),
              ),
            ),]),
        SizedBox(
          height: 8,
        ),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 127, 232, 28),
                elevation: 3,
                side: BorderSide(
                    width: 1, color: Color.fromARGB(255, 127, 232, 28)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.fromLTRB(138, 13, 138, 13)),
            onPressed: () {},
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 95),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(11, 26, 13, 1),
                      padding: EdgeInsets.fromLTRB(0, 10, 25, 10)
                      
                      ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => loginform()));
                    },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 127, 232, 28),
                        fontWeight: FontWeight.bold,fontFamily: 'Archivo',),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ))
    ));
  }
}