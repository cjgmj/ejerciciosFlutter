import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:formvalidation/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-924f3.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';

    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json';

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();

    // print(decodedData);

    if (decodedData == null) return [];

    decodedData.forEach((key, value) {
      final prodTemp = ProductoModel.fromJson(value);
      prodTemp.id = key;

      productos.add(prodTemp);
    });

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }
}
