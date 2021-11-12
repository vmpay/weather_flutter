import 'package:http/http.dart' as http;

import 'weather_details_response.dart';
import 'weather_list_response.dart';

class WeatherService {
  WeatherService(this._key);

  final String _key;

  Future<WeatherListResponse> fetchWeatherList(
      List<String> ids, String units) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/group?id=${ids.fold('', (previousValue, element) => '$previousValue$element,')}&units=$units&appid=$_key'));
    if (response.statusCode == 200) {
      return WeatherListResponse.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load weather list');
    }
  }

  Future<WeatherDetailsResponse> fetchWeatherDetails(
      double lat, double lon, String units) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?appid=$_key&units=$units&lat=$lat&lon=$lon'));
    if (response.statusCode == 200) {
      return WeatherDetailsResponse.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load weather list');
    }
  }
}
