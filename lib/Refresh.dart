import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'data/location.dart';

class GetUserLocation extends StatefulWidget {
  const GetUserLocation({Key? key}) : super(key: key);

  @override
  _GetUserLocationState createState() => _GetUserLocationState();
}

class _GetUserLocationState extends State<GetUserLocation> {
  /// Determine the current position of the device.
  Future<void> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      Navigator.pushReplacementNamed(context, '/Home');
    }

    if (permission == LocationPermission.deniedForever) {
      Navigator.pushReplacementNamed(context, '/Home');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true,
            timeLimit: Duration(seconds: 15))
        .then((Position position) {
      Navigator.pushReplacementNamed(context, '/Home',
          arguments:
              Location(lat: position.latitude, long: position.longitude));
    });
  }

  void GoToCarte() async {
    await _determinePosition();
  }

  @override
  void initState() {
    super.initState();

    GoToCarte();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
