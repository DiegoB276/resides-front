/*
  All rights reserved © Fullcode.
  Code by © Fullcode.

  TODO: Refactorizar y completar funciones de filtrado.
 */

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resides/model/residence.dart';
import 'package:resides/user_screens/details_residence_screen.dart';
import 'package:resides/utils/formatters.dart';
import '../service/user_api.dart';

MapController controller = MapController(
  initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
);

List<Map> residenceTypes = [
  {
    "name": "Casa",
    "selected": false,
    "icon": const Icon(
      Icons.home_rounded,
      color: Colors.white,
    ),
  },
  {
    "name": "Apartamento",
    "selected": false,
    "icon": const Icon(
      Icons.apartment,
      color: Colors.white,
    ),
  },
  {
    "name": "Habitación",
    "selected": true,
    "icon": const Icon(
      Icons.bed,
      color: Colors.white,
    ),
  },
  {
    "name": "Apartaestudio",
    "selected": false,
    "icon": const Icon(
      Icons.bedroom_child,
      color: Colors.white,
    ),
  }
];

//Contenido del Bottom Sheet.
//Información de la residencia al presionar un marcador.

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.residenceId,
  });

  final int residenceId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: FutureBuilder(
        future: UserAPI.getResidenceById(residenceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black,
                size: 35,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text("Error de conexión"),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No hay datos"),
            );
          }
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 50,
                    height: 7,
                    decoration: BoxDecoration(
                      color: const Color(0xffA7A7A7),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/img/img1.jpg",
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.65,
                            child: Text(
                              snapshot.data!['name_residence'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xff494949),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.people),
                              const SizedBox(width: 3),
                              Text(
                                "${snapshot.data!['ability']} Personas",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        snapshot.data!['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xff727272)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Precio Men: ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff268C30),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: PriceFormatter(
                                    price: snapshot.data!['price'],
                                    style: const TextStyle(
                                      fontSize: 15.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    moneyType: "COP",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Residence res = Residence(
                                idResidence: snapshot.data!["idResidences"],
                                images: [
                                  "assets/img/img2.jpg",
                                  "assets/img/img2.jpg",
                                  "assets/img/img2.jpg",
                                  "assets/img/img2.jpg"
                                ],
                                nameResidence: snapshot.data!["name_residence"],
                                addressResidence: snapshot.data!["address"],
                                cityResidence: snapshot.data!["city"],
                                departmentResidence:
                                    snapshot.data!["department"],
                                neighborhood: snapshot.data!["neighborhood"],
                                rooms: snapshot.data!['rooms'],
                                priceResidence: snapshot.data!["price"],
                                stateResidence: snapshot.data!["state"],
                                services: snapshot.data!["services"],
                                descriptionResidence:
                                    snapshot.data!["description"],
                                capacityResidence: snapshot.data!["ability"],
                                category: snapshot.data!["category"],
                                lat: snapshot.data!["geolocation"]["latitude"],
                                longt: snapshot.data!["geolocation"]
                                    ["longitude"],
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsResidenceScreen(residence: res),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffD0B0B0),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Color(0xff7E5656),
                                  ),
                                  Text(
                                    "Ver información",
                                    style: TextStyle(
                                        color: Color(0xff7E5656),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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
