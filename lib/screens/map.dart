import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealtimeMapScreen extends StatefulWidget {
  RealtimeMapScreen({Key key}) : super(key: key);
  @override
  _RealtimeMapScreenState createState() => new _RealtimeMapScreenState();
}

class _RealtimeMapScreenState extends State<RealtimeMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    List<Marker> allMarkers = [
      Marker(
        markerId: MarkerId('secondMarker'),
        position: LatLng(30.1701457, 31.4918564),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('MIU location'),
      ),
      body: GoogleMap(
        markers: Set.from(allMarkers),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(30.1701457, 31.4918564),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
