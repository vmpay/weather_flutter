import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_flutter_architecture/repository/repository.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';

class WeatherListStore extends StreamStore<Exception, List<ListElement>> {
  WeatherListStore(this._repository) : super(const []);
  final Repository _repository;
  int _calls = 0;

  Future<void> requestWeatherList() async {
    _calls++;
    setLoading(true);

    try {
      final WeatherListResponse response = await _repository.fetchWeatherList([
        '756135',
        '703448',
        '2643743',
        '964137',
        '5308655',
        '1850147',
        '1070940',
        '4180439',
        '3441575',
      ]);
      List<ListElement> value = response.list ?? [];
      if (_calls < 2) {
        update(value);
      } else if (_calls < 5) {
        update(value);
      } else {
        setError(Exception('Error: state not can be > 4'));
      }
    } on Exception catch (e) {
      setError(e);
    }
    setLoading(false);
  }
}
