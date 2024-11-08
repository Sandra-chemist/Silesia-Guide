import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/text_styles.dart';
import 'package:silesia_guide/utils/texts.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * animation.value + 20.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                recommendedText,
                style: headerTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
