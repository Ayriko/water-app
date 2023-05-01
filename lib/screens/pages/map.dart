import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //MyMap({super.key});

  late GoogleMapController mapController;
  //LatLng? _currentPosition;
  //bool _isLoading = true;
  List<Marker> _markers = [];
  final LatLng _center =
      const LatLng(44.837789, -0.57918); //centrer sur position du user

 @override
  void initState() {
    super.initState();
    //getLocation();
    _fetchFountains();
  }

  Future<void> _fetchFountains() async {
    final url =
        'https://opendata.bordeaux-metropole.fr/api/records/1.0/search/?dataset=bor_fontaines_eau_potable&q=&rows=215&refine.etat=fonctionnelle';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final records = json['records'] as List<dynamic>;

      setState(() {
        _markers = records.map((record) {
          final fields = record['fields'] as Map<String, dynamic>;
          final geometry = record['geometry'] as Map<String, dynamic>;
          final position =
              LatLng(geometry['coordinates'][1], geometry['coordinates'][0]);

          return Marker(
            markerId: MarkerId(fields['nom_fontaine']),
            position: position,
            infoWindow: InfoWindow(
                title: fields['nom_fontaine'], snippet: fields['adresse']),
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to fetch fountains');
    }
  }

 /* getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }*/

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers.toSet(),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
      ),
    );
  }
}
