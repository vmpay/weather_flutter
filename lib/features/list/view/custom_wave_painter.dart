import 'package:flutter/widgets.dart';

class CustomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    path.moveTo(0, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.77,
        size.width * 0.52, size.height * 0.84);
    path.quadraticBezierTo(
        size.width * 0.74, size.height * 0.92, size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    paint.color = const Color(0xFF4493ff);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
