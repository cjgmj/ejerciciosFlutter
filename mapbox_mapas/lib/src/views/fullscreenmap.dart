import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapboxMap(
            accessToken:
                'pk.eyJ1IjoiY2pnbWoiLCJhIjoiY2tlOXltbmU1MmJiYjJ6b2JocWIza2ZxaiJ9.rbpjNhT0JEuzbO0XJ9SPjw',
            onMapCreated: _onMapCreate,
            initialCameraPosition: const CameraPosition(
                target: LatLng(37.810575, -122.477174), zoom: 14)));
  }

  void _onMapCreate(MapboxMapController controller) {
    mapController = controller;
  }
}
