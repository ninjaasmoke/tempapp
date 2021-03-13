import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {}

class FetchCountryEvent extends CountryEvent {
  @override
  List<Object> get props => [];
}
