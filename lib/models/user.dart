import 'dart:ffi';

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late Float tbouteille;
  @HiveField(4)
  late Float bouteiller;
  @HiveField(5)
  late String location;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.tbouteille,
    required this.bouteiller,
    required this.location,
  });

  String key() => name.hashCode.toString();
}
