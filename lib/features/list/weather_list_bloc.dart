import 'package:rxdart/rxdart.dart';
import 'package:weather_flutter_architecture/repository/repository.dart';
import 'package:weather_flutter_architecture/repository/weather_list_response.dart';
import 'package:weather_flutter_architecture/utils/base_bloc.dart';
import 'package:weather_flutter_architecture/utils/loading_value.dart';

class WeatherListBloc extends BaseBloc {
  WeatherListBloc(Repository repository) : super(repository);

  final _weatherFetcher = PublishSubject<LoadingValue<List<ListElement>>>();
  bool firstTime = true;

  Stream<LoadingValue<List<ListElement>>> get weatherList =>
      _weatherFetcher.stream;

  fetchWeatherList() async {
    try {
      List<ListElement>? list;
      if (firstTime) {
        firstTime = false;
      } else {
        _weatherFetcher.sink.add(LoadingValue(null, true));
        WeatherListResponse response = await repository.fetchWeatherList([
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
        list = response.list;
      }
      _weatherFetcher.sink
          .add(LoadingValue(list ?? await Future.value([]), false));
    } on Exception catch (e) {
      _weatherFetcher.sink.addError(e);
    }
  }

  @override
  dispose() {
    _weatherFetcher.close();
  }
}
