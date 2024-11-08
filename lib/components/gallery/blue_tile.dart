import 'package:flutter/material.dart';
import 'package:silesia_guide/components/gallery/custom_tile.dart';
import 'package:silesia_guide/utils/colors.dart';

class BlueTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final String imagePath;
  final Color imageColor;

  const BlueTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.imagePath,
    this.imageColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTileBase(
      onTap: onTap,
      text: text,
      backgroundColor: backgroundColor,
      imagePath: imagePath,
      imageColor: imageColor.withAlpha(120),
      isExpanded: false,
    );
  }
}
