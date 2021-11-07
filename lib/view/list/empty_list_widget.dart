import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4493ff),
                Color(0xFFFFFFFF),
              ]),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: Image.asset('assets/graphics/sun.png'),
            ),
            Expanded(child: Container()),
            const Text(
              'To add your\nfirst location',
              style: TextStyle(fontSize: 32),
            ),
            RichText(
              text: const TextSpan(
                text: 'click +',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black),
              ),
            ),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(bottom: 40),
              child: Image.asset('assets/graphics/girl.png'),
            )
          ],
        ),
      );
}
