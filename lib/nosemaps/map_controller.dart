import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

import 'Utils/mapStyle.dart';

// ignore: camel_case_types
class map_controller extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onLongPress(LatLng position) {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final marker = Marker(
        markerId: markerId,
        draggable: true,
        position: position,
        anchor: const Offset(0.5, 1),
        onDragEnd: (newPosition) {
          print("new position $newPosition");
        },
        onTap: () {
          _markersController.sink.add(id);
                }
        // onLongPress: (){
        //   _markers.sink.add(id);
        // }
        );
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
