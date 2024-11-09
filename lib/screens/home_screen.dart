import 'package:flutter/material.dart';
import 'package:silesia_guide/components/buttons/button_section.dart';
import 'package:silesia_guide/components/gallery/gallery.dart';
import 'package:silesia_guide/components/header.dart';
import 'package:silesia_guide/components/buttons/scroll_to_top_button.dart';
import 'package:silesia_guide/components/buttons/semi_circular_button.dart';
import 'package:silesia_guide/utils/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
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

    Future.delayed(const Duration(seconds: 12), () {
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

  void _toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap16),
        child: Stack(
          children: [
            SemiCircularButton(onPressed: () {}, animation: _textPositionAnimation),
            Header(animation: _textPositionAnimation),
            ButtonsSection(animation: _textPositionAnimation),
            GallerySection(
              scrollController: _scrollController,
              isFavoriteList: isFavoriteList,
              toggleFavorite: _toggleFavorite,
              imagePositionAnimation: _imagePositionAnimation,
            ),
            if (scrollOffset > 100) ScrollToTopButton(onPressed: _scrollToTop)
          ],
        ),
      ),
    );
  }
}
