import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherListCardWidget extends StatelessWidget {
  const WeatherListCardWidget(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF85b9ff),
                    Color(0xFF398dff),
                    Color(0xFF378cff),
                  ]),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, right: 15),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: Image.asset('assets/graphics/sun_icon.png'),
                ),
                const Text(
                  'Kraków',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${index + 1} March, 2020',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Expanded(child: Container()),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '13°',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' / 10°',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
