import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class nort extends StatefulWidget {
  const nort({super.key});

  @override
  State<nort> createState() => _nortState();
}

// ignore: camel_case_types
class _nortState extends State<nort> {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  final Completer<GoogleMapController> _controller = Completer();

  // ignore: prefer_const_constructors
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: const LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(0, 0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
