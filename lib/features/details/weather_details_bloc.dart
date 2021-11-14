import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:weather_flutter_architecture/repository/repository.dart';
import 'package:weather_flutter_architecture/utils/base_bloc.dart';
import 'package:weather_flutter_architecture/utils/loading_value.dart';
import 'package:weather_flutter_architecture/utils/weather_details_mapper.dart';

import 'item_details_model.dart';

class WeatherDetailsBloc extends BaseBloc {
  WeatherDetailsBloc(Repository repository) : super(repository) {
    _cityInput.stream.transform(_itemTransformer()).pipe(_weatherDetails);
  }

  final _cityInput = PublishSubject<InputDetailsModel?>();
  final _weatherDetails =
      BehaviorSubject<Future<LoadingValue<ItemDetailsModel>>>();

  Function(InputDetailsModel?) get fetchWeatherDetails => _cityInput.sink.add;

  Stream<Future<LoadingValue<ItemDetailsModel>>> get weatherDetails =>
      _weatherDetails.stream;

  @override
  dispose() async {
    _cityInput.close();
    await _weatherDetails.drain();
    _weatherDetails.close();
  }

  StreamTransformer<InputDetailsModel?, Future<LoadingValue<ItemDetailsModel>>>
      _itemTransformer() => ScanStreamTransformer((acc, curr, i) {
            if (curr != null) {
              acc = repository.fetchWeatherDetails(curr.lat, curr.lon).then(
                  (value) => LoadingValue(
                      value.toItemDetailsModel(curr.city, curr.country),
                      false));
            } else {
              acc = Future.value(LoadingValue(null, true));
            }
            return acc;
          }, Future.value(LoadingValue(null, true)));
}

class InputDetailsModel {
  InputDetailsModel(this.city, this.country, this.lat, this.lon);

  final String city;
  final String country;
  final double lat;
  final double lon;
}
