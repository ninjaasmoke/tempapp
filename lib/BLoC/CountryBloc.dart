import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidaura/BLoC/CountryEvent.dart';
import 'package:kidaura/BLoC/CountryState.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:kidaura/Repo/CountryRepo.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository countryRepository;

  CountryBloc({@required this.countryRepository})
      : assert(countryRepository != null),
        super(null);

  // TODO: implement initialState
  CountryState get initialState => CountryInitialState();

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is FetchCountryEvent) {
      yield CountryLoadingState();
      print("In mapEventToState");

      try {
        final List<Country> countries =
            await countryRepository.fetchCountries();
        yield CountryLoadedState(countries: countries);
      } catch (e) {
        yield CountryErrorState(message: e.toString());
      }
    }
  }
}
