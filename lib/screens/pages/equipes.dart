import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:water_app/screens/pages/calendrier.dart';
import 'package:water_app/screens/pages/page_accueil.dart';
class Equipes extends StatelessWidget {
  const Equipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Center(child : Text('Water App')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Quality.png'),
            onPressed:() {},
            )
        ],
        backgroundColor:Color.fromARGB(255, 95, 208, 243),
       
      ),
    );
  }
}