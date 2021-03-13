import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidaura/Models/Country.dart';

class CountryApi {
  final String baseURL = "https://restcountries.eu/rest/v2";

  Future<List<Country>> fetchCountries() async {
    final url = '$baseURL/all';
    final response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      return [];
      // throw new Exception('Error getting countries');
    }

    List<Country> countries = [];
    final json = jsonDecode(response.body);
    for (var country in json) {
      countries.add(Country.fromJson(country));
    }
    return countries;
  }
}
