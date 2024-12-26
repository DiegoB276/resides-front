/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import '../../model/residence.dart';

class CapacityInformationResidence extends StatelessWidget {
  const CapacityInformationResidence({
    super.key,
    required this.residence,
  });

  final Residence residence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xffEFF5F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${residence.rooms}",
                  style: const TextStyle(
                    color: Color(0xff379B41),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Habitaciones"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${residence.capacityResidence}",
                  style: const TextStyle(
                    color: Color(0xff379B41),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Personas"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  residence.cityResidence,
                  style: const TextStyle(
                    color: Color(0xff379B41),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Ciudad"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
