import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/nosemaps/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps',
      home: nort(),
    );
  }
}

class nort extends StatefulWidget {
  @override
  State<nort> createState() => nortState();
}

// ignore: camel_case_types
class nortState extends State<nort> {
  // final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(2.9740654, -75.2850609),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider<map_controller>(
      create:  (_){
        final controller = map_controller();
        controller.onMarkerTap.listen((String id) {
          print("got to $id"); 
        });
        return controller;
      },
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.orange,
        ),
      body: Consumer<map_controller>(builder:(_,controller,__) => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        onLongPress: controller.onLongPress,
        onMapCreated: controller.onMapCreated,
        markers: controller.markers,
      ),
    )),
     ));
  }

}