import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';

import 'view/custom_wave_painter.dart';
import 'view/empty_list_widget.dart';
import 'view/weather_list_widget.dart';
import 'weather_list_store.dart';

class ListScreen extends StatelessWidget {
  const ListScreen(this._weatherListStore, {Key? key}) : super(key: key);
  final WeatherListStore _weatherListStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScopedBuilder(
            store: _weatherListStore,
            onState: (context, List<ListElement> state) => state.isEmpty
                ? const EmptyListWidget()
                : WeatherListWidget(state),
            onError: (context, error) => Center(
              child: Text(
                error.toString(),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            onLoading: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
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
            _weatherListStore.requestWeatherList();
          },
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF4493ff),
        ),
      ),
    );
  }
}
