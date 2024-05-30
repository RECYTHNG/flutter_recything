import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  LatLng currentLatLng = const LatLng(
    -7.961501123727859,
    112.61468991534397,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(Icons.location_searching)),
      body: Center(
        child: GoogleMap(
          markers: {
            Marker(
              markerId: const MarkerId('currentPosition'),
              position: currentLatLng,
            ),
          },
          onMapCreated: (GoogleMapController mapController) {
            _controller.complete(mapController);
            if (kDebugMode) {
              print(mapController.mapId);
            }
          },
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: currentLatLng,
            zoom: 20,
          ),
        ),
      ),
    );
  }
}
