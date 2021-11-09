import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_architecture/repository/weather_details_response.dart';
import 'package:weather_flutter_architecture/utils/builders.dart';
import 'package:weather_flutter_architecture/utils/constants.dart';
import 'package:weather_flutter_architecture/utils/degree_direction_mapper.dart';

import 'models/item_details_model.dart';

class WeatherDetailsStore
    extends StreamStore<Exception, List<ItemDetailsModel>> {
  WeatherDetailsStore() : super([]);
  bool _isOdd = false;
  final DateFormat _daysFormat = DateFormat('EEEE');
  final DateFormat _hourFormat = DateFormat('HH:mm');

  Future<void> requestDetails(
      String city, String country, double lat, double lon) async {
    _isOdd = !_isOdd;
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    final WeatherDetailsResponse response = buildWeatherDetailsResponse();
    final DateTime now = DateTime.now();
    final List<DailyForecast> daily = response.daily.map((e) {
      final DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(e.dt * 1000);
      final String day = dateTime.difference(now).isNegative
          ? 'Today'
          : _daysFormat.format(dateTime);
      return DailyForecast(day, e.weather![0].icon, e.temp.day);
    }).toList();
    final List<AdditionalInfo> info = [];
    for (var i = 0; i < response.hourly.length; i += 3) {
      final Current item = response.hourly[i];
      info.add(AdditionalInfo(
          _hourFormat
              .format(DateTime.fromMillisecondsSinceEpoch(item.dt * 1000)),
          item.weather[0].description,
          '${item.temp}°'));
    }
    info
      ..add(AdditionalInfo(separator, '', ''))
      ..add(AdditionalInfo(
          '',
          'Sunrise',
          _hourFormat.format(DateTime.fromMillisecondsSinceEpoch(
              response.current.sunrise! * 1000))))
      ..add(AdditionalInfo(
          '',
          'Sunset',
          _hourFormat.format(DateTime.fromMillisecondsSinceEpoch(
              response.current.sunset! * 1000))))
      ..add(AdditionalInfo('', 'Cloudiness', '${response.current.clouds}%'))
      ..add(AdditionalInfo('', 'Humidity', '${response.current.humidity}%'))
      ..add(
          AdditionalInfo('', 'Wind speed', '${response.current.windSpeed} m/s'))
      ..add(AdditionalInfo(
          '', 'Wind direction', mapDegrees(response.current.windDeg)))
      ..add(AdditionalInfo('', 'Feels like', '${response.current.feelsLike}°'))
      ..add(AdditionalInfo('', 'Pressure', '${response.current.pressure} hPa'))
      ..add(
          AdditionalInfo('', 'Visibility', '${response.current.visibility} m'))
      ..add(AdditionalInfo('', 'UV index', '${response.current.uvi}'))
      ..add(AdditionalInfo('', 'Dew point', '${response.current.dewPoint}°'));
    final ItemDetailsModel itemDetailsModel = ItemDetailsModel(city, country,
        response.current.temp, response.current.weather[0].icon, daily, info);
    if (_isOdd) {
      update([itemDetailsModel]);
    } else {
      setError(Exception('Error: fetching details failed'));
    }
    setLoading(false);
  }
}
