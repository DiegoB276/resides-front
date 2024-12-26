/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:resides/model/residence.dart';
import 'marker_residence.dart';

class MapUbicationResidence extends StatelessWidget {
  const MapUbicationResidence({
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
          const Text(
            "Ubicación",
            style: TextStyle(
              color: Color(0xff656565),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 400,
              child: OSMFlutter(
                controller: MapController(
                  initPosition: GeoPoint(
                    latitude: residence.lat,
                    longitude: residence.longt,
                  ),
                ),
                mapIsLoading: Container(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  height: double.infinity,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cargando datos del Mapa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      CircularProgressIndicator(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                osmOption: OSMOption(
                  zoomOption: const ZoomOption(
                    initZoom: 16,
                    minZoomLevel: 3,
                    maxZoomLevel: 18,
                    stepZoom: 0.5,
                  ),
                  showContributorBadgeForOSM: true,
                  roadConfiguration: const RoadOption(
                    roadColor: Colors.yellowAccent,
                  ),
                  enableRotationByGesture: true,
                  staticPoints: [
                    StaticPositionGeoPoint(
                      "point_${residence.idResidence}",
                      MarkerIcon(
                        iconWidget: MarkerResidence(
                          price: residence.priceResidence,
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                      [
                        GeoPoint(
                            latitude: residence.lat,
                            longitude: residence.longt),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
