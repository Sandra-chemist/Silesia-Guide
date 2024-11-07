import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';

class SemiCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double diameter;

  const SemiCircularButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = AppColors.greenColor,
    this.diameter = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        size: Size(diameter, diameter),
        painter: SemiCircularButtonPainter(backgroundColor),
      ),
    );
  }
}

class SemiCircularButtonPainter extends CustomPainter {
  final Color backgroundColor;

  SemiCircularButtonPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = backgroundColor;

    Path path = Path();
    path.addArc(Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.height / 2), 0, 3.14);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
