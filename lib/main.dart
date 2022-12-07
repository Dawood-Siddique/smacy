import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const GetStarted(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(11, 26, 13, 1),
        primaryColor: const Color.fromRGBO(173, 225,0 , 1),
      ),
    )
  );
}
// 173,225,0 as main color
// 11,26,13 as background color


class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
          Image(
            image: AssetImage('picture/get01.jpg'),
          ),
          
            
             Center(
               child: Container(
                color: Colors.amber,
                child: Text('OKAY'),
            ),
             ),
            Center(
              child: Container(
                color: Colors.red,
                child: Text('OKAY'),
              ),
            ),
            
               
          
        ],
        
        
      ),
    );
  }
}
