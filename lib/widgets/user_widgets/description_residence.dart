/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import '../../model/residence.dart';


class DescriptionResidence extends StatelessWidget {
  const DescriptionResidence({
    super.key,
    required this.residence,
  });

  final Residence residence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Descripción",
            style: TextStyle(
              color: Color(0xff5E5E5E),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            residence.descriptionResidence,
            style: const TextStyle(
              color: Color(0xff727272),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
