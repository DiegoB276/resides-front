/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:resides/model/residence.dart';
import '../service/user_api.dart';
import '../widgets/user_widgets/marker_residence.dart';

Future<List<StaticPositionGeoPoint>> getGeoPoints() async {
  final data = await UserAPI.getResidences();
  try {
    List<StaticPositionGeoPoint> listGeoPoints = [];
    for (int i = 0; i < data!.length; i++) {
      final myGeopoint = StaticPositionGeoPoint(
        "res_${data[i]['idResidences']}",
        MarkerIcon(
          iconWidget: MarkerResidence(
            price: data[i]['price'],
            icon: const Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 15,
            ),
          ),
        ),
        [
          GeoPoint(
            latitude: data[i]['geolocation']['latitude'],
            longitude: data[i]['geolocation']['longitude'],
          ),
        ],
      );
      listGeoPoints.add(myGeopoint);
    }
    return listGeoPoints;
  } catch (error) {
    error.toString();
    return [];
  }
}

Future<Residence> getResidenceById(int id) async {
  final data = await UserAPI.getResidenceById(id);
  Residence residence = Residence(
    idResidence: data["idResidences"],
    images: [
      "assets/img/img2.jpg",
      "assets/img/img2.jpg",
      "assets/img/img2.jpg",
      "assets/img/img2.jpg"
    ],
    nameResidence: data["name"],
    addressResidence: data["address"],
    cityResidence: data["city"],
    departmentResidence: data["department"],
    neighborhood: data["neighborhood"],
    rooms: 4,
    priceResidence: data["price"],
    stateResidence: data["state"],
    services: data["services"],
    descriptionResidence: data["description"],
    capacityResidence: data["ability"],
    category: data["category"],
    lat: data["geolocation"]["latitude"],
    longt: data["geolocation"]["longitude"],
  );
  return residence;
}

Future<List<Residence>> getResidencesToSearch() async {
  final List<dynamic>? data = await UserAPI.getResidences();
  List<Residence> residences = [];
  try{
    for (int index = 0; index < data!.length; index++) {
    Residence residence = Residence(
      idResidence: data[index]["idResidences"],
      images: [
        "assets/img/img2.jpg",
        "assets/img/img2.jpg",
        "assets/img/img2.jpg",
        "assets/img/img2.jpg"
      ],
      nameResidence: data[index]["name"],
      addressResidence: data[index]["address"],
      cityResidence: data[index]["city"],
      departmentResidence: data[index]["department"],
      neighborhood: data[index]["neighborhood"],
      rooms: 4,
      priceResidence: data[index]["price"],
      stateResidence: data[index]["state"],
      services: data[index]["services"],
      descriptionResidence: data[index]["description"],
      capacityResidence: data[index]["ability"],
      category: data[index]["category"],
      lat: data[index]["geolocation"]["latitude"],
      longt: data[index]["geolocation"]["longitude"],
    );
    residences.add(residence);
  }
  return residences;
  }
  catch(exception){
    exception.toString();
    return [];
  }
}
