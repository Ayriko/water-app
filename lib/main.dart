import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:water_app/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await Hive.initFlutter();
  final box = await Hive.openBox('waterApp');

  if (await Permission.location.serviceStatus.isEnabled) {
  } else {}

  var status = await Permission.location.status;
  if (status.isGranted) {

  } else if (status.isDenied) {
    
  }

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet Flutter',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
