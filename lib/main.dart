import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'view/details/details_screen.dart';

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
      // home: ListScreen(),
      home: DetailsScreen('Warsaw', 'Poland', 52.2298, 21.0118),
    );
  }
}
