/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/utils/formatters.dart';
import '../../model/residence.dart';


class ListViewServicesResidence extends StatelessWidget {
  const ListViewServicesResidence({
    super.key,
    required this.residence,
  });

  final Residence residence;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      color: const Color(0xffEFF5F1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: residence.services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.tag_faces_outlined,
                  color: Color(0xff379B41),
                  size: 35,
                ),
                Text(
                  textFormatted(residence.services[index]),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff676767),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
