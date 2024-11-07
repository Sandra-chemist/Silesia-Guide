import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/text_styles.dart';

class ImageCardComponent extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final String caption;

  const ImageCardComponent({
    super.key,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.caption,
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: gap8, vertical: gap8),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withAlpha(100),
                ),
                child: Text(
                  caption,
                  style: captionTextStyle,
                  softWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
