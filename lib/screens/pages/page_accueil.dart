import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  @override
  Widget build(BuildContext context) {
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
          title,
          Transform.rotate(
            angle: 0,
            child: boxSection,
          ),
          box1Section,
          box2Section,
        ],
      ),
    );
  }
}

Widget title = Container(
    height: 150,
    child: Center(
      child: Text(
        "Hi Username",
        style: GoogleFonts.paytoneOne(
          color: const Color.fromARGB(255, 18, 138, 176),
          fontSize: 50,
          // fontWeight: FontWeight.w700,
        ),
      ),
    ));

Widget boxSection = Container(
  child: Image.asset('assets/images/Water.png'),
);

Widget box1Section = Container(
  margin: EdgeInsets.only(top: 20),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromARGB(255, 18, 138, 176)),
  width: 250,
  padding: EdgeInsets.all(20),
  child: Text(
    '0.8L/1.5L in your bottle',
    textAlign: TextAlign.center,
    style: GoogleFonts.paytoneOne(
      color: const Color.fromARGB(255, 196, 242, 255),
      fontSize: 15,
      // fontWeight: FontWeight.w700,
    ),
  ),
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
