import 'package:flutter/material.dart';

Color primary = const Color(0xff052F5F);
Color azul = const Color(0xff005377);
Color verde = const Color(0xff06A77D);
Color crema = const Color(0xffD5C67A);
Color secondary = const Color(0xffF1A208);

miTema(BuildContext con) {
  return ThemeData(
      primaryColor: primary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.amber,
      ).copyWith(secondary: Colors.green));
}
