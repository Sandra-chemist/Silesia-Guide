import 'package:flutter/material.dart';
import 'package:silesia_guide/components/custom_tile.dart';
import 'package:silesia_guide/components/image_card.dart';
import 'package:silesia_guide/components/button_component.dart';
import 'package:silesia_guide/components/scroll_to_top_button.dart';
import 'package:silesia_guide/components/semi_circular_button.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/image_path.dart';
import 'package:silesia_guide/utils/spacing.dart';
import 'package:silesia_guide/utils/text_styles.dart';
import 'package:silesia_guide/utils/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imagePositionAnimation;
  late Animation<double> _textPositionAnimation;
  final ScrollController _scrollController = ScrollController();

  List<bool> isFavoriteList = List.generate(8, (index) => false);
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _imagePositionAnimation = Tween<double>(begin: 0.4, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _textPositionAnimation = Tween<double>(begin: 0.4, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 11), () {
      _controller.forward();
    });

    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap16),
        child: Stack(
          children: [
            _semiCircularButtonBuild(),
            _headerBuild(),
            _buttonsBuild(),
            _galleryBuild(),
            if (scrollOffset > 100) _scrollButtonBuild()
          ],
        ),
      ),
    );
  }

  Widget _semiCircularButtonBuild() {
    return AnimatedBuilder(
      animation: _textPositionAnimation,
      builder: (context, child) {
        return Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height * _textPositionAnimation.value - 60,
          child: SemiCircularButton(onPressed: () {}),
        );
      },
    );
  }

  Widget _scrollButtonBuild() => Positioned(bottom: 20, right: 0, child: ScrollToTopButton(onPressed: _scrollToTop));

  Widget _headerBuild() {
    return AnimatedBuilder(
      animation: _textPositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * _textPositionAnimation.value + 20.0,
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

  Widget _buttonsBuild() {
    return AnimatedBuilder(
      animation: _textPositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * _textPositionAnimation.value + 60.0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonComponent(
                    label: paidText,
                    onPressed: () {},
                    isFirstButton: true,
                  ),
                  const SizedBox(width: gap8),
                  ButtonComponent(
                    label: freeText,
                    onPressed: () {},
                    isFirstButton: false,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _greenContainerBuild(double height) {
    return AnimatedBuilder(
      animation: _textPositionAnimation,
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

  Widget _galleryBuild() {
    double screenWidth = MediaQuery.of(context).size.width;
    double height =
        screenWidth < 600 ? MediaQuery.of(context).size.height * 0.24 : MediaQuery.of(context).size.width * 0.5;
    double greenContainerHeight =
        screenWidth < 600 ? MediaQuery.of(context).size.height * 0.12 : MediaQuery.of(context).size.width * 0.25;

    return AnimatedBuilder(
      animation: _imagePositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * _imagePositionAnimation.value + 120,
          left: 0,
          right: 0,
          bottom: 0,
          child: GridView.builder(
            controller: _scrollController,
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
                  setState(() {
                    isFavoriteList[adjustedIndex] = !isFavoriteList[adjustedIndex];
                  });
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
}
