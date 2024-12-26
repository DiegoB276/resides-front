/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/utils/formatters.dart';

class MarkerResidence extends StatelessWidget {
  const MarkerResidence({
    super.key,
    required this.icon,
    required this.price,
  });

  final Icon icon;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 90,
      child: Column(
        children: [
          Container(
            height: 20,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: PriceFormatter(
                price: price,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
                moneyType: "",
              ),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
