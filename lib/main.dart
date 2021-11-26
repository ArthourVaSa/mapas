import 'package:flutter/material.dart';
import 'package:mapas_2/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mapas',
      initialRoute: '/',
      routes: getAplicationRoute(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
    );
  }
}
