/*
  All rights reserved © Fullcode.
  Code by © Fullcode.

  TODO: Implementar interacción del "Me Gusta"
 */

import 'package:flutter/material.dart';
import 'package:resides/service/user_api.dart';
import 'package:resides/user_screens/data_no_found_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/residence.dart';
import '../widgets/user_widgets/item_residence_carousel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'details_residence_screen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  
  SharedPreferences? pref;

  void getUserId()async{
    pref = await SharedPreferences.getInstance();
    final id = await pref!.getInt("user_id");
    print(id);
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserAPI.getResidences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/img/img3.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.15,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   LoadingAnimationWidget.inkDrop(color: Colors.white, size: 35),
                    const SizedBox(height: 13),
                    const Text(
                      "Consultando Datos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const DataNoFoundPage();
          }
          return PageView.builder(
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.antiAlias,
            itemCount: snapshot.data!.length,
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
              return ItemResidenceCarousel(
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
