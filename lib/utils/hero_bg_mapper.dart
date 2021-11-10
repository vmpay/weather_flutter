import 'package:flutter/cupertino.dart';

BoxDecoration mapStringToHeroBackground(String? id) {
  switch (id) {
    case '01d':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/sun.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF85b9ff),
              Color(0xFF398dff),
              Color(0xFF378cff),
            ]),
      );
    case '01n':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/hero_stars.png'),
            alignment: Alignment.topCenter),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF559dff),
            ]),
      );
    case '02d':
    case '03d':
    case '04d':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_night.png'),
            alignment: Alignment.bottomCenter),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF559dff),
              Color(0xFF1b4490),
            ]),
      );
    case '02n':
    case '03n':
    case '04n':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_night.png'),
            alignment: Alignment.bottomCenter),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF559dff),
            ]),
      );
    case '09d':
    case '10d':
    case '11d':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_rain.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF559dff),
              Color(0xFF1b4490),
            ]),
      );
    case '09n':
    case '10n':
    case '11n':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_rain.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF559dff),
            ]),
      );
    case '13d':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_snow.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF559dff),
              Color(0xFF1b4490),
            ]),
      );
    case '13n':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/clouds_snow.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF559dff),
            ]),
      );
    case '50d':
    case '50n':
      return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/graphics/hero_fog.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5d5d5d),
              Color(0xFFffffff),
            ]),
      );
    default:
      return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFffc635),
              Color(0xFFf2b10a),
            ]),
      );
  }
}
