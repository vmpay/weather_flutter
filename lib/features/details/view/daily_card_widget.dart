import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_flutter_architecture/utils/icon_mapper.dart';

import '../item_details_model.dart';

class DailyCardWidget extends StatelessWidget {
  const DailyCardWidget(this._daily, {Key? key}) : super(key: key);
  final DailyForecast _daily;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 5),
        child: SizedBox(
          width: 120,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(_daily.day),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(mapStringToAsset(_daily.icon)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '${_daily.temp}°',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
