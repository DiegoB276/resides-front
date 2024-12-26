/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:resides/model/residence.dart';
import '../widgets/user_widgets/capacity_information_residence.dart';
import '../widgets/user_widgets/description_residence.dart';
import '../widgets/user_widgets/header_residence_information.dart';
import '../widgets/user_widgets/list_view_services_residence.dart';
import '../widgets/user_widgets/map_ubication_residence.dart';

class DetailsResidenceScreen extends StatefulWidget {
  const DetailsResidenceScreen({super.key, required this.residence});

  final Residence residence;

  @override
  State<DetailsResidenceScreen> createState() => _DetailsResidenceScreenState();
}

class _DetailsResidenceScreenState extends State<DetailsResidenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 320,
                  child: PageView.builder(
                    itemCount: widget.residence.images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.residence.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            HeaderInformationResidence(residence: widget.residence),
            const SizedBox(height: 10),
            ListViewServicesResidence(residence: widget.residence),
            const SizedBox(height: 15),
            DescriptionResidence(residence: widget.residence),
            const SizedBox(height: 20),
            CapacityInformationResidence(residence: widget.residence),
            const SizedBox(height: 20),
            MapUbicationResidence(
              residence: widget.residence,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: MaterialButton(
          onPressed: () {},
          color: Color(0xff005810),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                "Hablar con Arrendador",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
