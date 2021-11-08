import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter_architecture/view/list/list_screen.dart';

void main() {
  runApp(const MyApp());
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
      home: ListScreen(),
      // home: const DetailsScreen(),
    );
  }
}
