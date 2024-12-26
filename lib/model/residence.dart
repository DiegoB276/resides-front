/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

class Residence {

  Residence({
    required this.idResidence,
    required this.images,
    required this.nameResidence,
    required this.addressResidence,
    required this.cityResidence,
    required this.departmentResidence,
    required this.neighborhood,
    required this.rooms,
    required this.priceResidence,
    required this.stateResidence,
    required this.services,
    required this.descriptionResidence,
    required this.capacityResidence,
    required this.category,
    required this.lat,
    required this.longt,
  });

  final int idResidence;
  final List<String> images;
  final String nameResidence;
  final String addressResidence;
  final String cityResidence;
  final String departmentResidence;
  final String neighborhood;
  final int rooms;
  final int priceResidence;
  final bool stateResidence;
  final List<dynamic> services;
  final String descriptionResidence;
  final int capacityResidence;
  final String category;
  final double lat;
  final double longt;
}