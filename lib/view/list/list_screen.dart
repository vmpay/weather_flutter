import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_wave_painter.dart';
import 'weather_list_widget.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WeatherListWidget(),
          Container(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              child: const SizedBox(
                width: double.infinity,
                height: 400,
              ),
              painter: CustomWavePainter(),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 80),
              child: Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '°C',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  const Text(
                    ' / ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '°F',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          onPressed: () {
            print('Click!');
          },
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF4493ff),
        ),
      ),
    );
  }
}
