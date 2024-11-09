import 'package:flutter/material.dart';
import 'package:silesia_guide/components/gallery/blue_tile.dart';
import 'package:silesia_guide/components/gallery/green_tile.dart';
import 'package:silesia_guide/components/image_card.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/image_path.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/texts.dart';

class GallerySection extends StatelessWidget {
  final ScrollController scrollController;
  final List<bool> isFavoriteList;
  final Animation<double> imagePositionAnimation;
  final Function(int) toggleFavorite;

  const GallerySection({
    super.key,
    required this.scrollController,
    required this.isFavoriteList,
    required this.toggleFavorite,
    required this.imagePositionAnimation,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height =
        screenWidth < 600 ? MediaQuery.of(context).size.height * 0.24 : MediaQuery.of(context).size.width * 0.5;

    double greenContainerHeight =
        screenWidth < 600 ? MediaQuery.of(context).size.height * 0.12 : MediaQuery.of(context).size.width * 0.25;

    return AnimatedBuilder(
      animation: imagePositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * imagePositionAnimation.value + 120,
          left: 0,
          right: 0,
          bottom: 0,
          child: GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: gap8,
              crossAxisSpacing: gap8,
              mainAxisExtent: height,
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _greenContainerBuild(greenContainerHeight);
              }
              if (index == 2) {
                return Transform.translate(
                  offset: Offset(0, -(height / 2)),
                  child: BlueTile(
                    onTap: () {},
                    text: trailsText,
                    backgroundColor: AppColors.blueColor,
                    imagePath: tracesImage,
                  ),
                );
              }
              int adjustedIndex = index - 1;
              bool isInSecondColumn = adjustedIndex % 2 != 0;

              Widget item = ImageCardComponent(
                imagePath: imagePaths[adjustedIndex],
                isFavorite: isFavoriteList[adjustedIndex],
                onFavoriteTap: () {
                  toggleFavorite(adjustedIndex);
                },
                caption: captions[adjustedIndex],
              );

              if (isInSecondColumn) {
                return Transform.translate(
                  offset: Offset(0, -(height / 2)),
                  child: item,
                );
              }
              return item;
            },
            itemCount: imagePaths.length,
          ),
        );
      },
    );
  }

  Widget _greenContainerBuild(double height) {
    return AnimatedBuilder(
      animation: imagePositionAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: GreenTile(
                onTap: () {},
                text: travelText,
                backgroundColor: AppColors.greenColor,
                imagePath: flagsImage,
                height: height,
              ),
            ),
          ],
        );
      },
    );
  }
}
