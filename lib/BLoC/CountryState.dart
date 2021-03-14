import 'package:flutter/material.dart';
import 'package:kidaura/Models/Country.dart';

abstract class CountryState {
  const CountryState();
}

class CountryInitialState extends CountryState {
  const CountryInitialState();
}

class CountryLoadingState extends CountryState {
  final String mes;
  const CountryLoadingState({@required this.mes});
}

class CountrySuccessState extends CountryState {
  final List<Country> countries;

  CountrySuccessState({@required this.countries});
}

class CountryErrorState extends CountryState {
  final String err;
  CountryErrorState({@required this.err});
}
