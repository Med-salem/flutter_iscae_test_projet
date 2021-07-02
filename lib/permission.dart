import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AskPermission extends StatefulWidget {
  const AskPermission({Key? key}) : super(key: key);

  @override
  _AskPermissionState createState() => _AskPermissionState();
}

class _AskPermissionState extends State<AskPermission> {
  //var LocationState = Permission.location.status;
  void doit() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Permission.location.request();
    }
    Navigator.pushReplacementNamed(context, '/Refresh');
  }

  @override
  void initState() {
    super.initState();
    doit();
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
