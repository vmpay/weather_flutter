import 'package:weather_flutter_architecture/repository/repository.dart';

abstract class BaseBloc {
  BaseBloc(this.repository);

  final Repository repository;

  dispose();
}
