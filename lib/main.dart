import 'package:flutter/material.dart';
import 'package:silesia_guide/components/bottom_navbar.dart';
import 'package:silesia_guide/screens/events_screen.dart';
import 'package:silesia_guide/screens/explore_screen.dart';
import 'package:silesia_guide/screens/home_screen.dart';
import 'package:silesia_guide/screens/news_screen.dart';
import 'package:silesia_guide/utils/colors.dart';

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
        scaffoldBackgroundColor: AppColors.backgroundHomePageColor,
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
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.width < 600 ? 90 : 40,
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      body: _screens[_currentIndex],
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
