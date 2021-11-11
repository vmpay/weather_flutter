import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_flutter_architecture/middleware/weather_details_store.dart';
import 'package:weather_flutter_architecture/middleware/weather_list_store.dart';
import 'package:weather_flutter_architecture/repository/repository.dart';
import 'package:weather_flutter_architecture/view/details/details_screen.dart';
import 'package:weather_flutter_architecture/view/list/list_screen.dart';
import 'package:weather_flutter_architecture/view/not_found_screen.dart';
import 'package:weather_flutter_architecture/view/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Repository()),
        Bind.lazySingleton((i) => WeatherListStore(i())),
        Bind.factory((i) => WeatherDetailsStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SplashScreen(),
            transition: TransitionType.fadeIn),
        ChildRoute('/weather',
            child: (context, args) =>
                ListScreen(Modular.get<WeatherListStore>()),
            transition: TransitionType.rightToLeft),
        ChildRoute(
            '/weather/details?city=:city&country=:country&lat=:lat&lon=:lon',
            child: (context, args) => DetailsScreen(
                  args.queryParams['city'],
                  args.queryParams['country'],
                  args.queryParams['lat'],
                  args.queryParams['lon'],
                  Modular.get<WeatherDetailsStore>(),
                ),
            transition: TransitionType.leftToRightWithFade),
        WildcardRoute(child: (context, args) => const NotFoundScreen()),
      ];
}
