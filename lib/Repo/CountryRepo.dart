import 'package:kidaura/API/CountriesApiClient.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final CountryApi countryApi = CountryApi();

  Future<List<Country>> fetchCountries() async {
    var response = await http.get("https://restcountries.eu/rest/v2/all");
    if (response.statusCode == 200) {
      print(response.body);
    } else
      print("Some error");
  }
}
