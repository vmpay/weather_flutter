import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, '/weather');
    });
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/graphics/group_2.png'),
          const Padding(
            padding: EdgeInsets.only(top: 90.0),
            child: Text(
              'Welcome to',
              style: TextStyle(fontSize: 32),
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'WEATHER APP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
