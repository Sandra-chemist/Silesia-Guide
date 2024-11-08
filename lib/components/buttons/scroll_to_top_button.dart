import 'package:flutter/material.dart';
import 'dart:math';
import 'package:silesia_guide/utils/colors.dart';

class ScrollToTopButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScrollToTopButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.greenColor,
        shape: const CircleBorder(),
        child: Transform.rotate(
          angle: pi / 2,
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
