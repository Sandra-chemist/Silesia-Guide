import 'dart:math';

import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/text_styles.dart';

class CustomTileBase extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color imageColor;
  final Color iconColor;
  final String imagePath;
  final double? height;
  final bool isGreenContainer;
  final bool isExpanded;
  final double imageHeight;

  const CustomTileBase({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.imagePath,
    required this.imageColor,
    this.iconColor = AppColors.whiteColor,
    this.textColor = AppColors.whiteColor,
    this.height,
    this.isGreenContainer = false,
    this.isExpanded = false,
    this.imageHeight = 70,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: isGreenContainer ? height : null,
        child: Stack(
          children: [
            _alignBuild(
              child: Image.asset(
                imagePath,
                color: imageColor,
                height: imageHeight,
              ),
              alignment: Alignment.topLeft,
              gap: gap16,
            ),
            _alignBuild(
              child: Transform.rotate(
                angle: pi / 1.34,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                ),
              ),
              alignment: Alignment.topRight,
              gap: gap8,
            ),
            _alignBuild(
              child: Text(
                text,
                style: captionTextStyle.copyWith(color: textColor, height: 1),
              ),
              alignment: Alignment.bottomLeft,
              gap: gap16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _alignBuild({required Widget child, required AlignmentGeometry alignment, required double gap}) {
    return Align(
      alignment: alignment,
      child: Padding(padding: EdgeInsets.all(gap), child: child),
    );
  }
}
