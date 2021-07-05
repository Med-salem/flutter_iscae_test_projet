import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'menu_list.dart';
import 'data/location.dart';
import 'data/result.dart';
import 'data/place_response.dart';

class Carte extends StatefulWidget {
  const Carte({Key? key}) : super(key: key);

  @override
  _CarteState createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  //map controller variable
  late GoogleMapController mapController;

  //location
  static double latitude = 18.11983555702137;
  static double longitude = -15.939569373830926;
  Location userLocation = Location(lat: latitude, long: longitude);

  //markers
  List<Marker> markers = <Marker>[];

  late List<Result> places;

  //initialise Map Controller
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //pharmacies Markers
  void pharmaciesMarkers() async {
    final String response = await rootBundle.loadString('assets/info.json');

    final data = json.decode(response);
    places = PlaceResponse.parseResults(data['results']);
    for (int i = 0; i < places.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(places[i].placeId),
          position: LatLng(places[i].geometry.location.lat,
              places[i].geometry.location.long),
          infoWindow: InfoWindow(
            title: places[i].name,
            snippet: places[i].vicinity,
            onTap: () => Navigator.pushNamed(context, '/PlaceInfo',
                arguments: places[i]),
          ),
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    pharmaciesMarkers();
  }

  @override
  Widget build(BuildContext context) {
    userLocation = ModalRoute.of(context)!.settings.arguments == null
        ? userLocation
        : ModalRoute.of(context)!.settings.arguments as Location;

    //initialise Camera On User Location
    final CameraPosition _myLocation = CameraPosition(
        target: LatLng(userLocation.lat, userLocation.long),
        zoom: 14,
        bearing: 15.0,
        tilt: 75.0);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: 'Search'),
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: MenuList(
            result: places,
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _myLocation,
          markers: Set<Marker>.of(markers),
        ),
      ),
    );
  }
}
