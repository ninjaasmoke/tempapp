import 'dart:convert';

import 'package:kidaura/API/CountriesApiClient.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final CountryApi countryApi = CountryApi();

  Future<List<Country>> fetchCountries() async {
    var response = await http.get("https://restcountries.eu/rest/v2/all");
    if (response.statusCode != 200) {
      print(response.statusCode);
      return [];
      // throw new Exception('Error getting countries');
    } else {
      List<Country> countries = [];
      final json = jsonDecode(response.body);
      for (var country in json) {
        countries.add(Country.fromJson(country));
      }
      return countries;
    }
  }
}
