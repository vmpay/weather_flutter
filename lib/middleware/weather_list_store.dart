import 'package:flutter_triple/flutter_triple.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/utils/builders.dart';

class WeatherListStore extends StreamStore<Exception, List<ListElement>> {
  WeatherListStore(List<ListElement> initialState) : super(initialState);
  int _calls = 0;

  Future<void> requestWeatherList() async {
    _calls++;
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    List<ListElement> value = <ListElement>[];
    if (_calls < 2) {
      update(value);
    } else if (_calls < 5) {
      update([buildListElement()]);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }
    setLoading(false);
  }
}
