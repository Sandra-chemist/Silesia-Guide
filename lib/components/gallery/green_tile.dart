import 'package:flutter/material.dart';
import 'package:silesia_guide/components/gallery/custom_tile.dart';
import 'package:silesia_guide/utils/colors.dart';

class GreenTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final double height;
  final String imagePath;
  final Color textColor;
  final Color imageColor;
  final Color iconColor;
  final double imageHeight;

  const GreenTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.imagePath,
    required this.height,
    this.textColor = AppColors.blackColor,
    this.imageColor = AppColors.blackColor,
    this.iconColor = AppColors.blackColor,
    this.imageHeight = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTileBase(
      onTap: onTap,
      text: text,
      backgroundColor: AppColors.greenColor,
      imagePath: imagePath,
      textColor: textColor,
      imageColor: imageColor,
      iconColor: iconColor,
      height: height,
      isGreenContainer: true,
      isExpanded: true,
      imageHeight: imageHeight,
    );
  }
}