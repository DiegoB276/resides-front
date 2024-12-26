/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';


class TypeResidenceMapItem extends StatelessWidget {
  const TypeResidenceMapItem({
    super.key,
    required this.label,
    required this.state,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool state;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: state ? const Color(0xff926E59) : const Color(0xff1C6C3D),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
