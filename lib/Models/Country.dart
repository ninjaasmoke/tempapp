import 'package:equatable/equatable.dart';

class Language {
  final String name;

  const Language({this.name});

  static Language fromJson(Map<String, dynamic> json) {
    return Language(name: json['name']);
  }
}

class Country extends Equatable {
  final String name;
  final String capital;
  final String flag;
  final String region;
  final String subRegion;
  final int population;
  final List borders;
  final List<String> languages;

  const Country(
      {this.name,
      this.capital,
      this.flag,
      this.region,
      this.subRegion,
      this.population,
      this.borders,
      this.languages});

  @override
  List<Object> get props =>
      [name, capital, flag, region, subRegion, population, borders, languages];

  static Country fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name'],
        capital: json['capital'],
        flag: json['flag'],
        region: json['region'],
        subRegion: json['subregion'],
        population: json['population'],
        borders: json['borders'],
        languages: getLangs(json['languages']));
  }

  @override
  String toString() => 'Country { name: $name}';
}

List<String> getLangs(List<dynamic> data) {
  List<String> _langs = [];
  for (var lang in data) {
    var json = Language.fromJson(lang);
    _langs.add(json.name);
  }
  return _langs;
}
