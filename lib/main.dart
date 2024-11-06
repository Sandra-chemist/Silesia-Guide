import 'package:flutter/material.dart';
import 'package:silesia_guide/components/bottom_navbar.dart';
import 'package:silesia_guide/screens/events_screen.dart';
import 'package:silesia_guide/screens/explore_screen.dart';
import 'package:silesia_guide/screens/home_screen.dart';
import 'package:silesia_guide/screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silesia Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    NewsScreen(),
    EventsScreen(),
    ExploreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavbar(
          currentIndex: _currentIndex,
          onTap: _onTap,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait ? buildPortrait() : buildLandscape(),
        ));
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildPortrait() => _screens[_currentIndex];
  Widget buildLandscape() => _screens[_currentIndex];
}
