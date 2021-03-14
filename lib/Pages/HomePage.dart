import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidaura/Pages/CountriesPage.dart';
import 'package:kidaura/Pages/CountryBlocPage.dart';
import 'package:kidaura/Pages/PageViewPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181827),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "KidAura",
          style: TextStyle(color: Colors.grey[300]),
        ),
        backgroundColor: Color(0xff181827),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff121212),
              child: Text("I have used a custom UI..."),
              alignment: Alignment.center,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getNavigationButton('PageView Page', PageViewPage()),
                  getNavigationButton('Countries Page', CountryPage()),
                  getNavigationButton('BLoC Countries Page', CountryBlocPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNavigationButton(String name, Widget page) {
    return OutlineButton(
        borderSide: BorderSide(
          color: Colors.blueGrey[200],
        ),
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => page));
        },
        child: Text(name, style: TextStyle(color: Colors.grey[300])));
  }
}
