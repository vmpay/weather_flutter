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

    await Future.delayed(const Duration(seconds: 1));

    List<ListElement> value = <ListElement>[];
    if (_calls < 2) {
      update(value);
    } else if (_calls < 5) {
      update(_repository.fetchWeatherList([]).list ?? []);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }
    setLoading(false);
  }
}
