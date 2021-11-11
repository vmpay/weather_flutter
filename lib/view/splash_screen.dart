import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onTap: () {
            Modular.to.navigate('/weather');
          },
          child: Column(
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
        ),
      );
}
