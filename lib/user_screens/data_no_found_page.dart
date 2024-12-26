/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';

class DataNoFoundPage extends StatelessWidget {
  const DataNoFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icon/error_icon.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Uppss, Parece que tenemos problemas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  "Verifica tu conexión, de lo contrario espera mientras nos encargamos nosotros.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
