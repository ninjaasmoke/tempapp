import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidaura/API/CountriesApiClient.dart';
import 'package:kidaura/BLoC/CountryBloc.dart';
import 'package:kidaura/BLoC/CountryState.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:kidaura/Repo/CountryRepo.dart';
import 'package:kidaura/Widgets/CountryItem.dart';

enum CurrState { loading, done }

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  CountryApi _countryApi = CountryApi();
  List<Country> _countries = [];
  CurrState _currState = CurrState.loading;

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(countryRepository: CountryRepository()),
      child: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xff181827),
            appBar: AppBar(
              backgroundColor: Color(0xff181827),
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "Countries loaded on init",
                style: TextStyle(color: Colors.grey[200]),
              ),
            ),
            body: _currState == CurrState.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.blueGrey,
                      height: 10,
                    ),
                    itemBuilder: (context, index) => CountryItem(
                      countries: _countries,
                      index: index,
                    ),
                    itemCount: _countries.length,
                  ),
          );
        },
      ),
    );
  }

  Future getCountries() async {
    setState(() {
      _currState = CurrState.loading;
    });
    _countries = await _countryApi.fetchCountries();
    setState(() {
      _currState = CurrState.done;
    });
  }
}

/*
if (state is CountryInitialState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CountryLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CountryLoadedState) {
                  return Center(
                    child: Text(state.countries.toString()),
                  );
                } else {
                  return Center(
                    child: Text("Error"),
                  );
                }
*/
