/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resides/model/residence.dart';
import 'package:resides/user_screens/data_no_found_page.dart';
import 'package:resides/widgets/general/item_residence.dart';
import '../service/user_api.dart';
import 'details_residence_screen.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("Residencias Favoritas"),
      ),
      body: FutureBuilder(
        future: UserAPI.getResidences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black,
                size: 35,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const DataNoFoundPage();
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.antiAlias,
            itemCount: 5,
            itemBuilder: (context, index) {
              Residence residence = Residence(
                idResidence: snapshot.data![index]['idResidences'],
                images: const [
                  "assets/img/img1.jpg",
                  "assets/img/img2.jpg",
                  "assets/img/img3.jpg",
                  "assets/img/img1.jpg"
                ],
                nameResidence: snapshot.data![index]['name_residence'],
                addressResidence: snapshot.data![index]['address'],
                cityResidence: snapshot.data![index]['city'],
                departmentResidence: snapshot.data![index]['department'],
                neighborhood: snapshot.data![index]['neighborhood'],
                rooms: snapshot.data![index]['rooms'],
                priceResidence: snapshot.data![index]['price'],
                stateResidence: snapshot.data![index]['state'],
                services: snapshot.data![index]['services'],
                descriptionResidence: snapshot.data![index]['description'],
                capacityResidence: snapshot.data![index]['ability'],
                category: snapshot.data![index]['category'],
                lat: snapshot.data![index]['geolocation']['latitude'],
                longt: snapshot.data![index]['geolocation']['longitude'],
              );
              return ItemResidence(
                idResidence: residence.idResidence,
                images: residence.images,
                nameResidence: residence.nameResidence,
                addresResidence: residence.addressResidence,
                cityResidence: residence.cityResidence,
                departmentResidence: residence.departmentResidence,
                neighborhood: residence.neighborhood,
                roomsResidence: residence.rooms,
                priceResidence: residence.priceResidence,
                stateResidence: residence.stateResidence,
                servicesResidence: residence.services,
                descriptionResidence: residence.descriptionResidence,
                capacityResidence: residence.capacityResidence,
                categoryResidence: residence.category,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsResidenceScreen(residence: residence),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
