import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidaura/Pages/CountriesPage.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlineButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => PageViewPage()));
                },
                child: Text("Go to Page 1",
                    style: TextStyle(color: Colors.grey[300]))),
            OutlineButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => CountryPage()));
                },
                child: Text("Go to Page 2",
                    style: TextStyle(color: Colors.grey[300])))
          ],
        ),
      ),
    );
  }
}
