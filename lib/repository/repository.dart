import 'package:weather_flutter_architecture/repository/weather_details_response.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/repository/weather_service.dart';

class Repository {
  Repository(this._weatherService);

  final WeatherService _weatherService;

  Future<WeatherListResponse> fetchWeatherList(List<String> ids) =>
      _weatherService.fetchWeatherList(ids, 'metric');

  Future<WeatherDetailsResponse> fetchWeatherDetails(double lat, double lon) =>
      _weatherService.fetchWeatherDetails(lat, lon, 'metric');
}
