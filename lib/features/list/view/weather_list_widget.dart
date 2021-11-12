import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';

import 'weather_list_card_widget.dart';

class WeatherListWidget extends StatelessWidget {
  const WeatherListWidget(this._list, {Key? key}) : super(key: key);
  final List<ListElement> _list;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
        child: GridView.count(
          // crossAxisCount is the number of columns
          crossAxisCount: 2,
          // This creates two columns with two items in each column
          children: _list.map((e) => WeatherListCardWidget(e)).toList(),
        ),
      );
}
