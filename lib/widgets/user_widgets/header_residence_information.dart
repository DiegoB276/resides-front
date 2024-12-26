/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import '../../model/residence.dart';
import '../../utils/formatters.dart';


class HeaderInformationResidence extends StatelessWidget {
  const HeaderInformationResidence({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width*0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textFormatted(residence.addressResidence),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Color(0xff9C9C9C),
                      ),
                    ),
                    Text(
                      textFormatted(residence.neighborhood),
                      style: const TextStyle(
                        color: Color(0xff9C9C9C),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceFormatter(
                    price: residence.priceResidence,
                    style: const TextStyle(
                      color: Color(0xff656565),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    moneyType: "COP",
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: residence.stateResidence
                          ? const Color(0XFF9F250D)
                          : const Color(0xff39BA51),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        residence.stateResidence
                            ? "Ocupada"
                            : "Disponible",
                        style: const TextStyle(
                          color: Color(0xffF2F2F2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            textFormatted(residence.nameResidence),
            style: const TextStyle(
              color: Color(0xff656565),
              fontSize: 25,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
