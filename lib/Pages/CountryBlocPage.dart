import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidaura/BLoC/CountryBloc.dart';
import 'package:kidaura/BLoC/CountryEvent.dart';
import 'package:kidaura/BLoC/CountryState.dart';
import 'package:kidaura/Models/Country.dart';
import 'package:kidaura/Repo/CountryRepo.dart';
import 'package:kidaura/Widgets/CountryItem.dart';

class CountryBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(countryRepository: CountryRepository())
        ..add(FetchCountryEvent()),
      child: Scaffold(
        backgroundColor: Color(0xff181827),
        appBar: AppBar(
          backgroundColor: Color(0xff181827),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Bloc countries..?",
            style: TextStyle(color: Colors.grey[200]),
          ),
        ),
        body: CountryBody(),
      ),
    );
  }
}

class CountryBody extends StatelessWidget {
  final List<Country> _countries = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryBloc, CountryState>(
      listener: (context, state) {
        if (state is CountryInitialState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Loading countries..."),
              backgroundColor: Colors.black));
        } else if (state is CountryLoadingState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Loading countries ..."),
              backgroundColor: Colors.black));
        } else if (state is CountrySuccessState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Loading countries success!!!"),
              backgroundColor: Colors.black));
        } else {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Error!"), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        if (state is CountryInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CountryLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CountrySuccessState) {
          _countries.addAll(state.countries);
          Scaffold.of(context).hideCurrentSnackBar();
        } else {
          return Center(
            child: Text("Error"),
          );
        }

        return ListView.separated(
            itemBuilder: (context, index) => CountryItem(
                  country: _countries[index],
                ),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey,
                  height: 0,
                ),
            itemCount: _countries.length);
      },
    );
  }
}
