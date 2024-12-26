/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/utils/formatters.dart';

class ItemResidence extends StatelessWidget {
  const ItemResidence({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                images[0],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.62,
                          child: Text(
                            textFormatted(nameResidence),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 44, 44, 44),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.people),
                            const SizedBox(width: 3),
                            Text("$capacityResidence Personas"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      textFormatted(descriptionResidence),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.1,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Precio Mensual: "),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xff268C30),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: PriceFormatter(
                                price: priceResidence,
                                moneyType: "COP",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffD0B0B0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Color(0xff7E5656),
                                ),
                                Text(
                                  "Ver más",
                                  style: TextStyle(
                                    color: Color(0xff7E5656),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
