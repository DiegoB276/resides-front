/*
  All rights reserved © Fullcode.
  Code by © Fullcode.

  TODO: Refactorizar Widgets de Información.
 */

import 'package:flutter/material.dart';
import 'package:resides/auth_screens/login_screen.dart';
import 'package:resides/controller/auth/login_controller.dart';
import 'package:resides/service/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  SharedPreferences? pref;
  int userId = 0;

  Future<int?> getUserId() async {
    pref = await SharedPreferences.getInstance();
    final int? id = await pref!.getInt("user_id");
    return id;
  }

  void getUserById() async {
    final id = await getUserId();
    setState(() {
      userId = id!;
    });
  }

  void setProfileStatusDefault()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("user_id", 0);
    return;
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Mi Perfil"),
      ),
      body: FutureBuilder(
        future: UserAPI.getUserByid(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return LoginScreen();
          }
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/img/img3.jpg",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                        "${snapshot.data!['first_name']} ${snapshot.data!['lastName']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Rol de usuario",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data!['role'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Número de Teléfono",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data!['phone'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Departamento",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data!['department'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Ciudad",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data!['city'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Correo Electrónico",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data!['mail'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirmar cierre de sesión'),
                              content: const Text(
                                  '¿Estás seguro de que quieres cerrar sesión?'),
                              actions: [
                                ElevatedButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () async {
                                    LoginController.logOut(context);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      color: Color(0xffBB0000),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Cerrar Sesión"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
