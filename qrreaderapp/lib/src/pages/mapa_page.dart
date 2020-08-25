import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:qrreaderapp/src/models/scan_model.dart';

class MapaPage extends StatelessWidget {
  final map = new MapController();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text('Coordenadas QR'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () => map.move(scan.getLatLng(), 15))
        ]),
        body: _crearFlutterMap(scan));
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
        mapController: map,
        options: MapOptions(center: scan.getLatLng(), zoom: 15),
        layers: [_crearMapa(), _crearMarcadores(scan)]);
  }

  _crearMapa() {
    // Estilos: https://docs.mapbox.com/api/maps/#styles
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/styles/v1/'
            '{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiY2pnbWoiLCJhIjoiY2tlOXltbmU1MmJiYjJ6b2JocWIza2ZxaiJ9.rbpjNhT0JEuzbO0XJ9SPjw',
          // 'id': 'mapbox/streets-v11'
          // 'id': 'mapbox/outdoors-v11'
          // 'id': 'mapbox/light-v10'
          // 'id': 'mapbox/dark-v10'
          // 'id': 'mapbox/satellite-v9'
          'id': 'mapbox/satellite-streets-v11'
        });
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100,
          height: 100,
          point: scan.getLatLng(),
          builder: (BuildContext context) => Container(
                child: Icon(Icons.location_on,
                    size: 60, color: Theme.of(context).primaryColor),
              ))
    ]);
  }
}
