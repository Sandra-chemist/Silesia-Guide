import 'package:flutter/material.dart';
import 'dart:math';

import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/text_styles.dart';

class CustomTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomTile({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            _alignBuild(
                child: Image.asset(
                  'assets/traces.png',
                  color: AppColors.whiteColor.withAlpha(120),
                  height: 70,
                ),
                alignment: Alignment.topLeft),
            _alignBuild(
                child: Transform.rotate(
                  angle: pi / 1.34,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.topRight),
            _alignBuild(
              child: Text(
                text,
                style: captionTextStyle,
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }

  Widget _alignBuild({required Widget child, required AlignmentGeometry alignment}) {
    return Align(
      alignment: alignment,
      child: Padding(padding: const EdgeInsets.all(gap16), child: child),
    );
  }
}
