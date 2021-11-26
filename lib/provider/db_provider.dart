import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DireccionesProvider {
  List<dynamic> direcciones = [];

  DireccionesProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/padron.json');

    Map dataMap = json.decode(resp);
    direcciones = dataMap['data'];
    print(direcciones);

    return direcciones;
  }
}

final direccionesProvider = new DireccionesProvider();
