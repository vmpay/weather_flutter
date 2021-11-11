import 'package:weather_flutter_architecture/repository/weather_details_response.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/utils/builders.dart';

class Repository {
  WeatherListResponse fetchWeatherList(List<String> ids) =>
      buildWeatherListResponse();

  WeatherDetailsResponse fetchWeatherDetails(double lat, double lon) =>
      buildWeatherDetailsResponse();
}
