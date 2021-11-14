import 'package:intl/intl.dart';
import 'package:weather_flutter_architecture/features/details/item_details_model.dart';
import 'package:weather_flutter_architecture/repository/weather_details_response.dart';

import 'constants.dart';
import 'degree_direction_mapper.dart';

extension ResponseMapper on WeatherDetailsResponse {
  ItemDetailsModel toItemDetailsModel(String city, String country) {
    final DateFormat daysFormat = DateFormat('EEEE');
    final DateFormat hourFormat = DateFormat('HH:mm');
    final DateTime now = DateTime.now();
    final List<DailyForecast> daily = this.daily.map((e) {
      final DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(e.dt * 1000);
      final String day = dateTime.difference(now).isNegative
          ? 'Today'
          : daysFormat.format(dateTime);
      return DailyForecast(day, e.weather![0].icon, e.temp.day);
    }).toList();
    final List<AdditionalInfo> info = [];
    for (var i = 0; i < hourly.length; i += 3) {
      final Current item = hourly[i];
      info.add(AdditionalInfo(
          hourFormat
              .format(DateTime.fromMillisecondsSinceEpoch(item.dt * 1000)),
          item.weather[0].description,
          '${item.temp}°'));
    }
    info
      ..add(AdditionalInfo(separator, '', ''))
      ..add(AdditionalInfo(
          '',
          'Sunrise',
          hourFormat.format(
              DateTime.fromMillisecondsSinceEpoch(current.sunrise! * 1000))))
      ..add(AdditionalInfo(
          '',
          'Sunset',
          hourFormat.format(
              DateTime.fromMillisecondsSinceEpoch(current.sunset! * 1000))))
      ..add(AdditionalInfo('', 'Cloudiness', '${current.clouds}%'))
      ..add(AdditionalInfo('', 'Humidity', '${current.humidity}%'))
      ..add(AdditionalInfo('', 'Wind speed', '${current.windSpeed} m/s'))
      ..add(AdditionalInfo('', 'Wind direction', mapDegrees(current.windDeg)))
      ..add(AdditionalInfo('', 'Feels like', '${current.feelsLike}°'))
      ..add(AdditionalInfo('', 'Pressure', '${current.pressure} hPa'))
      ..add(AdditionalInfo('', 'Visibility', '${current.visibility} m'))
      ..add(AdditionalInfo('', 'UV index', '${current.uvi}'))
      ..add(AdditionalInfo('', 'Dew point', '${current.dewPoint}°'));
    final ItemDetailsModel itemDetailsModel = ItemDetailsModel(
        city,
        country,
        current.temp,
        current.weather[0].icon,
        DateFormat('HH:mm MMMM dd')
            .format(DateTime.fromMillisecondsSinceEpoch(current.dt * 1000)),
        daily,
        info);
    return itemDetailsModel;
  }
}
