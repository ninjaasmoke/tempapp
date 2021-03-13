import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kidaura/Models/Country.dart';

abstract class CountryState extends Equatable {}

class CountryInitialState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoadingState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoadedState extends CountryState {
  final List<Country> countries;

  CountryLoadedState({@required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryErrorState extends CountryState {
  final String message;
  CountryErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
