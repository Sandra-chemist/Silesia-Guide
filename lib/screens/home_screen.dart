import 'package:flutter/material.dart';
import 'package:silesia_guide/components/image_card.dart';
import 'package:silesia_guide/components/button_component.dart';
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
  List<bool> isFavoriteList = List.generate(8, (index) => false);

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap16),
        child: Stack(
          children: [
            _headerBuild(),
            _buttonsBuild(),
            _galleryBuild(),
          ],
        ),
      ),
    );
  }

  Widget _headerBuild() {
    return AnimatedBuilder(
      animation: _textPositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * _textPositionAnimation.value + 20.0,
          left: 0,
          right: 0,
          child: Text(
            recommendedText,
            style: headerTextStyle,
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

  Widget _galleryBuild() {
    double screenWidth = MediaQuery.of(context).size.width;
    double height =
        screenWidth < 600 ? MediaQuery.of(context).size.height * 0.24 : MediaQuery.of(context).size.width * 0.5;

    return AnimatedBuilder(
      animation: _imagePositionAnimation,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * _imagePositionAnimation.value + 120,
          left: 0,
          right: 0,
          bottom: 0,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: gap8,
              crossAxisSpacing: gap8,
              mainAxisExtent: height,
            ),
            itemBuilder: (context, index) => ImageCardComponent(
              imagePath: imagePaths[index],
              isFavorite: isFavoriteList[index],
              onFavoriteTap: () {
                setState(() {
                  isFavoriteList[index] = !isFavoriteList[index];
                });
              },
              caption: captions[index],
            ),
            itemCount: imagePaths.length,
          ),
        );
      },
    );
  }
}
