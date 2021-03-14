import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidaura/Models/Country.dart';

class CountryItem extends StatelessWidget {
  final Country country;

  const CountryItem({Key key, @required this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name,
                      style: TextStyle(color: Colors.red[400], fontSize: 24),
                    ),
                    Text(
                      country.capital,
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    Text(
                      "Population: ${country.population}",
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    Text(
                      "\nBordering Countries",
                      style:
                          TextStyle(color: Colors.blueGrey[400], fontSize: 14),
                    ),
                    Text(
                      country.borders.toString(),
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    Text(
                      "\nLanguages Spoken",
                      style:
                          TextStyle(color: Colors.blueGrey[400], fontSize: 14),
                    ),
                    Text(
                      country.languages.toString(),
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    country.region,
                    style: TextStyle(color: Colors.grey[100], fontSize: 18),
                  ),
                  Text(
                    country.subRegion,
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
              // Image.network(country.flag)
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * (3 / 4),
            child: country.flag != null && country.flag.length != 0
                ? SvgPicture.network(country.flag)
                : Text("No flag"),
          )
        ],
      ),
    );
  }
}
