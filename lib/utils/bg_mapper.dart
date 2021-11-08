import 'package:flutter/cupertino.dart';

BoxDecoration mapStringToBackground(String? id) {
  switch (id) {
    case '01d':
      return const BoxDecoration(
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
            image: AssetImage('assets/graphics/stars.png'),
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
            image: AssetImage('assets/graphics/clouds_bg.png'),
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
            image: AssetImage('assets/graphics/clouds_bg.png'),
            alignment: Alignment.bottomCenter),
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
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6d6d6d),
              Color(0xFFcbcbcb),
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
