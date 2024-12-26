/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/user_screens/carousel_screen.dart';
//import 'package:resides/user_screens/chats_screen.dart';
import 'package:resides/user_screens/favourites_screen.dart';
import 'package:resides/user_screens/user_map_screen.dart';
import 'package:resides/user_screens/user_profile_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> pages = const [CarouselScreen(), UserMapScreen(), FavouritesScreen(),UserProfileScreen()];
  int index = 0;

  

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff5C5C5C),
        onTap: (value){
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Inicio",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Mapa",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
            backgroundColor: Colors.black,
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
            backgroundColor: Colors.black,
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_sharp),
            label: "Perfil",
            backgroundColor: Colors.black,
          ),
          
        ],
        
      ),
    );
  }
}
