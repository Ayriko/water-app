import 'package:flutter/material.dart';

class Calendrier extends StatelessWidget {
  const Calendrier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
