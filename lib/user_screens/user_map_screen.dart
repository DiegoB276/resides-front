/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

/*
  TODO: Implementar filtrado en la barra de búsqueda.

  TODO: Implementar filtrado y actualizaciones del mapa (Botones).
 */

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resides/controller/user_map_controller.dart';
import 'package:resides/model/residence.dart';
import '../utils/map_utils.dart';
import '../widgets/user_widgets/type_residences_map_items.dart';
import '../widgets/user_widgets/user_marker_residence.dart';

class UserMapScreen extends StatefulWidget {
  const UserMapScreen({super.key});

  @override
  State<UserMapScreen> createState() => _UserMapScreenState();
}

class _UserMapScreenState extends State<UserMapScreen> {
  late TextEditingController searchController;
  List<Residence> residences = [];
  List<StaticPositionGeoPoint> locations = [];

  void changeStateSelectedTypeResidence(int index) {
    setState(() {
      for (int i = 0; i < residenceTypes.length; i++) {
        {
          residenceTypes[i]['selected'] = false;
        }
        residenceTypes[index]['selected'] = true;
      }
    });
  }

  void getMapResidences()async{
    try{
      final data = await getResidencesToSearch();
    setState(() {
      residences = data;
    });
    }
    catch(error){
      error.toString();
    }
  }


  void getLocations() async {
    List<StaticPositionGeoPoint> points = await getGeoPoints();
    try {
      setState(() {
        locations = points;
        //print("LOCATON POINTS: ${locations[0].id}");
      });
    } catch (error) {
      error.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getMapResidences();
    getLocations();
    searchController = TextEditingController();
    setState(() {
      locations = [];
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OSMFlutter(
          controller: controller,
          mapIsLoading: Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimationWidget.inkDrop(color: Colors.white, size: 35),
                const SizedBox(height: 15),
                const Text(
                  "Estamos preparando Todo...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onGeoPointClicked: (GeoPoint value) async {
            for (StaticPositionGeoPoint staticPoint in locations) {
              for (GeoPoint geoPoint in staticPoint.geoPoints) {
                if (geoPoint.latitude == value.latitude &&
                    geoPoint.longitude == value.longitude) {
                  int residenceId = int.parse(staticPoint.id.split("_").last);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    enableDrag: false,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return BottomSheetContent(residenceId: residenceId);
                    },
                  );
                }
              }
            }
          },
          osmOption: OSMOption(
            userTrackingOption: const UserTrackingOption(
              enableTracking: true,
              unFollowUser: true,
            ),
            zoomOption: const ZoomOption(
              initZoom: 15.5,
              minZoomLevel: 3,
              maxZoomLevel: 19,
              stepZoom: 0.5,
            ),
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                iconWidget: UserMarker(),
              ),
              directionArrowMarker: const MarkerIcon(
                iconWidget: UserMarker(),
              ),
            ),
            roadConfiguration: const RoadOption(
              roadColor: Colors.yellowAccent,
            ),
            enableRotationByGesture: true,
            staticPoints: locations,
          ),
        ),
        Positioned(
          top: 50,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 120,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: TextField(
                      controller: searchController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        hintText: "Buscar Residencias",
                        hintStyle: TextStyle(
                          color: Color(0xff828282),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 105, 105, 105),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: residenceTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TypeResidenceMapItem(
                        label: residenceTypes[index]["name"],
                        state: residenceTypes[index]["selected"],
                        icon: residenceTypes[index]["icon"],
                        onTap: () => changeStateSelectedTypeResidence(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
