import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_architecture/features/details/details_screen.dart';
import 'package:weather_flutter_architecture/features/details/weather_details_bloc.dart';
import 'package:weather_flutter_architecture/features/list/list_screen.dart';
import 'package:weather_flutter_architecture/features/list/weather_list_bloc.dart';
import 'package:weather_flutter_architecture/features/splash_screen.dart';
import 'package:weather_flutter_architecture/repository/repository.dart';
import 'package:weather_flutter_architecture/repository/weather_service.dart';

import 'features/not_found_screen.dart';

void main() {
  runApp(
    Provider(
        create: (_) => Repository(WeatherService('')), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: !kReleaseMode,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      // home: ListScreen(),
      // home: DetailsScreen('Warsaw', 'Poland', 52.2298, 21.0118),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }
        if (settings.name == '/weather') {
          return MaterialPageRoute(
              builder: (context) => Provider(
                    create: (_) =>
                        WeatherListBloc(Provider.of(context, listen: false)),
                    child: const ListScreen(),
                  ));
        }
        if (settings.name?.startsWith('/weather/details') == true) {
          final queryParameters = Uri.parse(settings.name!).queryParameters;
          final String? city = queryParameters['city'];
          final String? country = queryParameters['country'];
          final double? lat = double.tryParse(queryParameters['lat'] ?? '');
          final double? lon = double.tryParse(queryParameters['lon'] ?? '');
          InputDetailsModel? inputDetailsModel;
          if (city != null && country != null && lat != null && lon != null) {
            inputDetailsModel = InputDetailsModel(city, country, lat, lon);
          }
          return MaterialPageRoute(
              builder: (context) => Provider(
                    create: (_) => WeatherDetailsBloc(
                        Provider.of<Repository>(context, listen: false)),
                    child: DetailsScreen(inputDetailsModel),
                  ));
        }
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}
