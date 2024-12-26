/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  const UserMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 170,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Estás aquí",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const Icon(
            Icons.location_history,
            size: 50,
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}