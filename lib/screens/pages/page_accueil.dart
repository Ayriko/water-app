import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AccueilPage extends StatefulWidget {
  AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  final _myBox = Hive.box('waterApp');

  void _addWater() {
    double max = _myBox.get('volume', defaultValue: 1);
    _myBox.put('currW', max);
    setState(() {});
  }

  void _voidWater() {
    double curr = _myBox.get('currW', defaultValue: 1);
    curr -= 0.25;
    if (curr < 0) {
      curr = 0;
    }
    _myBox.put('currW', curr);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String name = _myBox.get('username', defaultValue: 'username');
    double currW = _myBox.get('currW', defaultValue: 1.0);
    double volume = _myBox.get('volume', defaultValue: 1.0);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 242, 255),
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
      body: Column(
        children: [
          Container(
            height: 150,
            child: Center(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Hi " + name,
                style: GoogleFonts.paytoneOne(
                  color: const Color.fromARGB(255, 18, 138, 176),
                  fontSize: 50,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: 0,
            child: boxSection,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 18, 138, 176))),
                onPressed: () => _addWater(),
                child: Text(
                  'Remplir',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.paytoneOne(
                    color: const Color.fromARGB(255, 196, 242, 255),
                    fontSize: 15,
                    // fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 18, 138, 176))),
                onPressed: () => _voidWater(),
                child: Text(
                  'Vider',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.paytoneOne(
                    color: const Color.fromARGB(255, 196, 242, 255),
                    fontSize: 15,
                    // fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 18, 138, 176)),
            width: 250,
            padding: EdgeInsets.all(20),
            child: Text(
              currW.toString() + 'L/' + volume.toString() + 'L in your bottle',
              textAlign: TextAlign.center,
              style: GoogleFonts.paytoneOne(
                color: const Color.fromARGB(255, 196, 242, 255),
                fontSize: 15,
                // fontWeight: FontWeight.w700,
              ),
            ),
          ),
          box2Section,
        ],
      ),
    );
  }
}

Widget boxSection = Container(
  child: Image.asset('assets/images/Water.png'),
);

Widget box2Section = Container(
  margin: EdgeInsets.only(top: 20),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromARGB(255, 18, 138, 176)),
  width: 250,
  padding: EdgeInsets.all(20),
  child: Text(
    'Is it still your first bottle ? You need to drink more',
    textAlign: TextAlign.center,
    style: GoogleFonts.paytoneOne(
      color: const Color.fromARGB(255, 196, 242, 255),
      fontSize: 15,
      // fontWeight: FontWeight.w700,
    ),
  ),
);
