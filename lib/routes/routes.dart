import 'package:flutter/material.dart';
import 'package:mapas_2/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{'/': (BuildContext context) => HomePage()};
}
