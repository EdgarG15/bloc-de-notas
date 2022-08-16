import 'package:flutter/material.dart';

import 'package:notas/pages/home.dart';
import 'package:notas/values/tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema(context),
        title: 'Bloc de notas',
        home: HomePage());
  }
}
