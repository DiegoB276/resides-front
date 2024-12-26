/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:country_state_city/country_state_city.dart';

class CountryStateCityClass {
  static Future<List<Country>> getCountries() async {
    final List<Country> countries = await getAllCountries();
    return countries;
  }

  static Future<List<State>> getStatesByCountry(String countryCode) async {
    final List<State> states = await getStatesOfCountry(countryCode);
    return states;
  }

  static Future<List<City>> getcitiesByCountryStateCode(
      String countryCode, String stateCode) async {
    final List<City> cities = await getStateCities(countryCode, stateCode);
    return cities;
  }
}