/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/owner_screens/aviable_residences_screen.dart';
import 'package:resides/owner_screens/disable_residences_screen.dart';
import 'package:resides/owner_screens/owner_map_screen.dart';
import 'package:resides/owner_screens/owner_profile_screen.dart';
//import 'package:resides/user_screens/chats_screen.dart';

class OwnerBottomNavigationPage extends StatefulWidget {
  const OwnerBottomNavigationPage({super.key});

  @override
  State<OwnerBottomNavigationPage> createState() =>
      _OwnerBottomNavigationPageState();
}

class _OwnerBottomNavigationPageState extends State<OwnerBottomNavigationPage> {
  List<Widget> pages = const [AviableResidencesScreen(), DisableResidencesScreen(), OwnerMapScreen(),OwnerProfileScreen()];
  int index = 0;
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
            icon: Icon(Icons.home_work_rounded),
            label: "Disponibles",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined),
            label: "Ocupadas",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: "Mapa",
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
