import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_2/provider/db_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  final LatLng colegio = LatLng(-3.746940, -73.246570);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
        centerTitle: true,
      ),
      body: _mapa(),
    );
  }

  Widget _mapa() {
    return FutureBuilder(
      future: direccionesProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Center(
          child: _crearMapa(snapshot.data, context),
        );
      },
    );
  }

  Widget _crearMapa(List<dynamic> data, BuildContext context) {
    data.forEach((opt) {
      list.add(opt);
    });

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.colegio,
        zoom: 16,
      ),
      markers: _crearMarker(),
    );
  }

  Set<Marker> _crearMarker() {
    var tmp = Set<Marker>();

    for (int i = 0; i <= list.length - 1; i++) {
      if (list[i]['NLAT_IE'] == list[i]['NLAT_IE']) {
        tmp.add(
          Marker(
            markerId: MarkerId(list[i]['IE']),
            position: LatLng(
                double.parse(list[i]['NLAT_IE'].replaceAll(',', '.')),
                double.parse(list[i]['NLONG_IE'].replaceAll(',', '.'))),
            infoWindow: InfoWindow(
                title: list[i]['IE'],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        list[i]['IE'],
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text('Código Modular: ${list[i]['COD_MOD']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Colegio ID: ${list[i]['ID_COL']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'Laboratorio de Cómputo: ${list[i]['LAB_COMP_U']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'N° de estudiantes promovidos: ${list[i]['NEST_PROM']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Nivel: ${list[i]['NIVEL']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'Alumnos Promovidos: ${list[i]['PORCEN_PROM']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  '% de alumnos promovidos: ${list[i]['PORC_PROM']}%'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'Total de Estudiantes: ${list[i]['TOT_EST']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Latitud: ${list[i]['NLAT_IE']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Longitud: ${list[i]['NLONG_IE']}'),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      }
    }

    return tmp;
  }
}
