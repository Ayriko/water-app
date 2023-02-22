import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:water_app/screens/pages/calendrier.dart';
import 'package:water_app/screens/pages/page_accueil.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 242, 255),
        body: Column (
            children: [
              //const SizedBox(height: 10),
              boxSection,
              //box1Section,
              //iconSection,
            ],
        ),
      );
  }
}




Widget boxSection = Container(
  height: 200,
  width: double.infinity,
  margin: const EdgeInsets.all(20),
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 140, 139, 212),
        Color.fromARGB(255, 48, 45, 185),
        // Color.fromARGB(255, 56, 20, 176),
        Color.fromARGB(255,17, 34, 86),
        Color.fromARGB(255,17, 34, 86),
        Color.fromARGB(255,99, 24, 24)       /*(20,239, 7, 7),*/        
      ],
    ),
  ),
  child: Row( 
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children:[      
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Dernier Match",
          style :TextStyle(color: Colors.white, fontFamily: 'SourceSerifPro-BoldItalic.ttf', fontSize: 20, /*fontStyle: FontStyle.italic,*/ decoration: TextDecoration.underline ),
          ),
          Text("SJ Macau \n 2-0 \n Ambares ES",
          textAlign: TextAlign.center,
          style :TextStyle(color: Colors.white, fontFamily: 'SourceSerifPro-BoldItalic.ttf', fontSize: 20 ),
          ),
          Icon(Icons.check,color: Colors.green, size: 30)

        ],
      ), 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("05/02/2023",
          textAlign: TextAlign.center,
          style :TextStyle(color: Colors.white, fontFamily: 'SourceSerifPro-BoldItalic.ttf', fontSize: 20 )
          ),
          const Text("SJ Macau \n VS \n FC APM",
          textAlign: TextAlign.center,
          style :TextStyle(color: Colors.white, fontFamily: 'SourceSerifPro-BoldItalic.ttf', fontSize: 20 ),
          ),
          Text("Prochain Match",
          style :TextStyle(color: Colors.white, fontFamily: 'SourceSerifPro-BoldItalic.ttf',fontSize: 20, /*fontStyle: FontStyle.italic,*/ decoration: TextDecoration.underline ),
          ),
        ],
      )
    ],
  ),
);
