import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';

class ImageCardComponent extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ImageCardComponent({
    super.key,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: gap8,
              right: gap8,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Container(
                  padding: const EdgeInsets.all(5),
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
                    color: isFavorite ? AppColors.heartFillColor : AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
