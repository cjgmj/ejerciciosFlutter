import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final center = LatLng(37.810575, -122.477174);
  String selectedStyle = 'mapbox://styles/cjgmj/ckeockq4m02331an42jvf4jx8';
  final oscuroStyle = 'mapbox://styles/cjgmj/ckeockq4m02331an42jvf4jx8';
  final streetStyle = 'mapbox://styles/cjgmj/ckeocmp010kkt19ppjbkf15uh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: crearMapa(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                child: Icon(Icons.add_to_home_screen),
                onPressed: () {
                  if (selectedStyle == oscuroStyle) {
                    selectedStyle = streetStyle;
                  } else {
                    selectedStyle = oscuroStyle;
                  }

                  setState(() {});
                })
          ],
        ));
  }

  MapboxMap crearMapa() {
    return MapboxMap(
        styleString: selectedStyle,
        accessToken:
            'pk.eyJ1IjoiY2pnbWoiLCJhIjoiY2tlOXltbmU1MmJiYjJ6b2JocWIza2ZxaiJ9.rbpjNhT0JEuzbO0XJ9SPjw',
        onMapCreated: _onMapCreate,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }

  void _onMapCreate(MapboxMapController controller) {
    mapController = controller;
  }
}
