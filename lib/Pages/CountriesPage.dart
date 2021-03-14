import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidaura/API/CountriesApiClient.dart';
import 'package:kidaura/BLoC/CountryBloc.dart';
import 'package:kidaura/BLoC/CountryState.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:kidaura/Repo/CountryRepo.dart';

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
                "Country details",
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
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _countries[index].name,
                                  style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 24),
                                ),
                                Text(
                                  _countries[index].capital,
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14),
                                ),
                                Text(
                                  "Population: ${_countries[index].population}",
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14),
                                ),
                                Text(
                                  "\nBordering Countries",
                                  style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 14),
                                ),
                                Text(
                                  _countries[index].borders.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14),
                                ),
                                Text(
                                  "\nLanguages Spoken",
                                  style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 14),
                                ),
                                Text(
                                  _countries[index].languages.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _countries[index].region,
                                style: TextStyle(
                                    color: Colors.grey[100], fontSize: 18),
                              ),
                              Text(
                                _countries[index].subRegion,
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14),
                              ),
                            ],
                          ),
                          // Image.network(_countries[index].flag)
                        ],
                      ),
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
