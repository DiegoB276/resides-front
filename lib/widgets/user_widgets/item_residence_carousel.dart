/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/utils/formatters.dart';

class ItemResidenceCarousel extends StatelessWidget {
  const ItemResidenceCarousel({
    super.key,
    required this.idResidence,
    required this.images,
    required this.nameResidence,
    required this.addresResidence,
    required this.cityResidence,
    required this.departmentResidence,
    required this.neighborhood,
    required this.roomsResidence,
    required this.priceResidence,
    required this.stateResidence,
    required this.servicesResidence,
    required this.descriptionResidence,
    required this.capacityResidence,
    required this.categoryResidence,
    required this.onTap,
  });

  final int idResidence;
  final List<String> images;
  final String nameResidence;
  final String addresResidence;
  final String cityResidence;
  final String departmentResidence;
  final String neighborhood;
  final int roomsResidence;
  final int priceResidence;
  final bool stateResidence;
  final List<dynamic> servicesResidence;
  final String descriptionResidence;
  final int capacityResidence;
  final String categoryResidence;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(images[0]),
              fit: BoxFit.cover,
              opacity: 0.45,
            ),
          ),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo de Residencia: ${textFormatted(categoryResidence)}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textFormatted(nameResidence),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    PriceFormatter(
                      price: priceResidence,
                      moneyType: "COP",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 15,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: stateResidence
                ? const Icon(
                    Icons.favorite_border_rounded,
                    size: 35,
                  )
                : const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 35,
                  ),
          ),
        ),
      ],
    );
  }
}
