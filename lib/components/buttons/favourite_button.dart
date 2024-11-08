import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(gap8),
        decoration: BoxDecoration(
          color: isFavorite ? Colors.transparent : AppColors.whiteColor.withAlpha(50),
          shape: BoxShape.circle,
          border: isFavorite
              ? Border.all(
                  color: AppColors.whiteColor,
                )
              : Border.all(color: Colors.transparent),
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? AppColors.greenColor : AppColors.whiteColor,
        ),
      ),
    );
  }
}
