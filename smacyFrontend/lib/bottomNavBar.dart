
import 'package:flutter/material.dart';
import 'package:smacy/Home.dart';


class navBar extends StatefulWidget {
  @override
  navBar_ createState() => navBar_();
}

class navBar_ extends State<navBar> {
  bool isHomeOn = true;
  
  int currentindex = 0;
  final screens = [
    Center(child:Home(userId: 1)),
    Center(child: Text("Under Development phase",style: TextStyle(color: Colors.white,fontSize: 20),)),
    Center(child: Text("Under Development phase",style: TextStyle(color: Colors.white,fontSize: 20),))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_new
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 15,
            currentIndex: currentindex,
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined
                      ),
                      activeIcon: Icon(Icons.home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                  ),
                  activeIcon: Icon(Icons.favorite),
                  label: "Wishlist"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.download_for_offline_outlined,
                  ),
                  activeIcon: Icon(Icons.download_for_offline),
                  label: "Download"),
            ],
          )),
      body: screens[currentindex],
    );
  }
}