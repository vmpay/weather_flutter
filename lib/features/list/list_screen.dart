import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_architecture/features/list/weather_list_bloc.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/utils/loading_value.dart';

import 'view/custom_wave_painter.dart';
import 'view/empty_list_widget.dart';
import 'view/weather_list_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late WeatherListBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of(context);
    _bloc.fetchWeatherList();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
            stream: _bloc.weatherList,
            builder: (context,
                AsyncSnapshot<LoadingValue<List<ListElement>>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.requireData.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return snapshot.requireData.value?.isNotEmpty == true
                      ? WeatherListWidget(snapshot.requireData.value!)
                      : const EmptyListWidget();
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
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
            _bloc.fetchWeatherList();
          },
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF4493ff),
        ),
      ),
    );
  }
}
