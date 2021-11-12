import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/utils/bg_mapper.dart';
import 'package:weather_flutter_architecture/utils/icon_mapper.dart';

class WeatherListCardWidget extends StatelessWidget {
  const WeatherListCardWidget(this.element, {Key? key}) : super(key: key);

  final ListElement element;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
            '/weather/details?city=${element.name}&country=${element.sys?.country}&lat=${element.coord?.lat}&lon=${element.coord?.lon}');
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            decoration: mapStringToBackground(element.weather?[0].icon),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 15),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child:
                      Image.asset(mapStringToAsset(element.weather?[0].icon)),
                ),
                Expanded(child: Container()),
                Text(
                  '${element.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yyyy, HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          element.dt == null ? 0 : element.dt! * 1000)),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${element.main?.tempMax}°',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' / ${element.main?.tempMin}°',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
