/*
  All rights reserved © Fullcode.
  Code by © Fullcode.

  TODO: Refactorizar.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class PriceFormatter extends StatelessWidget {
  const PriceFormatter({
    super.key,
    required this.price,
    required this.style,
    required this.moneyType,
  });

  final int price;
  final TextStyle style;
  final String moneyType;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${NumberFormat.currency(locale: 'es_CO', symbol: moneyType, decimalDigits: 0).format(
        price,
      )}",
      style: style,
    );
  }
}

String textFormatted(String text) {
  // Convierte el texto a bytes para decodificarlo
  List<int> bytes = text.codeUnits;
  // Decodifica los bytes en UTF-8
  return utf8.decode(bytes);
}