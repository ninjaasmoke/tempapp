import 'package:flutter/material.dart';
import 'package:kidaura/Models/Country.dart';

class CountryItem extends StatelessWidget {
  final List<Country> countries;
  final int index;

  const CountryItem({Key key, @required this.countries, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  countries[index].name,
                  style: TextStyle(color: Colors.red[400], fontSize: 24),
                ),
                Text(
                  countries[index].capital,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                Text(
                  "Population: ${countries[index].population}",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                Text(
                  "\nBordering Countries",
                  style: TextStyle(color: Colors.blueGrey[400], fontSize: 14),
                ),
                Text(
                  countries[index].borders.toString(),
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                Text(
                  "\nLanguages Spoken",
                  style: TextStyle(color: Colors.blueGrey[400], fontSize: 14),
                ),
                Text(
                  countries[index].languages.toString(),
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                countries[index].region,
                style: TextStyle(color: Colors.grey[100], fontSize: 18),
              ),
              Text(
                countries[index].subRegion,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ],
          ),
          // Image.network(countries[index].flag)
        ],
      ),
    );
  }
}
