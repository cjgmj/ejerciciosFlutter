import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final center = LatLng(37.810575, -122.477174);
  String selectedStyle = 'mapbox://styles/cjgmj/ckeocmp010kkt19ppjbkf15uh';

  final oscuroStyle = 'mapbox://styles/cjgmj/ckeockq4m02331an42jvf4jx8';
  final streetStyle = 'mapbox://styles/cjgmj/ckeocmp010kkt19ppjbkf15uh';

  void _onMapCreate(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(url);
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: crearMapa(), floatingActionButton: botonesFlotantes());
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Símbolos
        FloatingActionButton(
            child: Icon(Icons.location_on),
            onPressed: () {
              mapController.addSymbol(SymbolOptions(
                  geometry: center,
                  textField: 'Montaña creada aquí',
                  textOffset: Offset(0, 2),
                  // textColor: '#16b7c5',
                  iconSize: 3,
                  // iconImage: 'attraction-15',
                  iconImage: 'assetImage'));
            }),
        SizedBox(height: 5),
        // ZoomIn
        FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            }),
        SizedBox(height: 5),
        // ZoomOut
        FloatingActionButton(
            child: Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            }),
        SizedBox(height: 5),

        // Cambiar estilo
        FloatingActionButton(
            child: Icon(Icons.add_to_home_screen),
            onPressed: () {
              if (selectedStyle == oscuroStyle) {
                selectedStyle = streetStyle;
              } else {
                selectedStyle = oscuroStyle;
              }

              _onStyleLoaded();
              setState(() {});
            })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
        styleString: selectedStyle,
        accessToken:
            'pk.eyJ1IjoiY2pnbWoiLCJhIjoiY2tlOXltbmU1MmJiYjJ6b2JocWIza2ZxaiJ9.rbpjNhT0JEuzbO0XJ9SPjw',
        onMapCreated: _onMapCreate,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }
}
