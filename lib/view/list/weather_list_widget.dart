import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'weather_list_card_widget.dart';

class WeatherListWidget extends StatelessWidget {
  const WeatherListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
        child: GridView.count(
          // crossAxisCount is the number of columns
          crossAxisCount: 2,
          // This creates two columns with two items in each column
          children:
              List.generate(20, (int index) => WeatherListCardWidget(index)),
        ),
      );
}
