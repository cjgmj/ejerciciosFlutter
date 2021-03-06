import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:qrreaderapp/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();
  String tipoMapa = 'mapbox/streets-v11';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text('Coordenadas QR'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () => map.move(scan.getLatLng(), 15))
        ]),
        body: _crearFlutterMap(scan),
        floatingActionButton: _crearBoton(context, scan));
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
          'id': tipoMapa
          // 'id': 'mapbox/streets-v11'
          // 'id': 'mapbox/outdoors-v11'
          // 'id': 'mapbox/light-v10'
          // 'id': 'mapbox/dark-v10'
          // 'id': 'mapbox/satellite-v9'
          // 'id': 'mapbox/satellite-streets-v11'
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

  Widget _crearBoton(BuildContext context, ScanModel scan) {
    return FloatingActionButton(
        child: Icon(Icons.repeat),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if (tipoMapa == 'mapbox/streets-v11') {
            tipoMapa = 'mapbox/outdoors-v11';
          } else if (tipoMapa == 'mapbox/outdoors-v11') {
            tipoMapa = 'mapbox/light-v10';
          } else if (tipoMapa == 'mapbox/light-v10') {
            tipoMapa = 'mapbox/dark-v10';
          } else if (tipoMapa == 'mapbox/dark-v10') {
            tipoMapa = 'mapbox/satellite-v9';
          } else if (tipoMapa == 'mapbox/satellite-v9') {
            tipoMapa = 'mapbox/satellite-streets-v11';
          } else {
            tipoMapa = 'mapbox/streets-v11';
          }

          setState(() {});

          map.move(scan.getLatLng(), 30);

          Future.delayed(Duration(milliseconds: 50), () {
            map.move(scan.getLatLng(), 15);
          });
        });
  }
}
