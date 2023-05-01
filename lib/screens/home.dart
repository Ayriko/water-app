import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:water_app/screens/pages/map.dart';
import 'package:water_app/screens/pages/infos.dart';
import 'package:water_app/screens/pages/page_accueil.dart';
import 'package:water_app/screens/pages/test_raph.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> tab = [
    MyMap(),
    AccueilPage(),
    Infos(),
    Test(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 242, 255),
      body: tab[_currentIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _currentIndex,
        backgroundColor: const Color(0x00ffffff),
        gap: 15,
        color: const Color.fromARGB(255, 18, 138, 176),
        activeColor: const Color.fromARGB(255, 18, 138, 176),
        padding: const EdgeInsets.all(16),
        onTabChange: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        tabs: [
          GButton(
            icon: Icons.location_on,
            text: 'Map',
          ),
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
          GButton(
            icon: Icons.school_outlined,
            text: 'Test',
          )
        ],
      ),
    );
  }
}
