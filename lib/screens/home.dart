import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:water_app/screens/pages/map.dart';
import 'package:water_app/screens/pages/calendrier.dart';
import 'package:water_app/screens/pages/equipes.dart';
import 'package:water_app/screens/pages/infos.dart';
import 'package:water_app/screens/pages/page_accueil.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 2;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> tab = [
    Boutique(),
    Equipes(),
    AccueilPage(),
    Calendrier(),
    Infos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 242, 255),
      appBar: AppBar(
        title: const Center(child: Text('Water App')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Quality.png'),
            onPressed: () {},
          )
        ],
        backgroundColor: Color.fromARGB(255, 95, 208, 243),
      ),
      body: tab[_currentIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });

        //   _pageController.jumpToPage(_currentIndex);
        // },
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
            icon: Icons.water_drop,
            text: 'Conteneur',
          ),
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.calendar_month,
            text: 'Calendar',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          )
        ],
      ),
    );
  }
}
