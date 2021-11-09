import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_flutter_architecture/middleware/models/item_details_model.dart';
import 'package:weather_flutter_architecture/middleware/weather_details_store.dart';
import 'package:weather_flutter_architecture/view/details/weather_details_widget.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(this._city, this._country, this._lat, this._lon, {Key? key})
      : super(key: key);
  final String _city;
  final String _country;
  final double _lat;
  final double _lon;
  final WeatherDetailsStore _weatherDetailsStore = WeatherDetailsStore();

  @override
  Widget build(BuildContext context) {
    _weatherDetailsStore.requestDetails(_city, _country, _lat, _lon);
    return Scaffold(
      body: ScopedBuilder(
        store: _weatherDetailsStore,
        onState: (context, List<ItemDetailsModel> state) => state.isNotEmpty
            ? WeatherDetailsWidget(state.first)
            : const Center(
                child: Text(
                  'List is empty',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
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
    );
  }
}
