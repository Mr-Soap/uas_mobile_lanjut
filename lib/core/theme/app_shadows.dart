import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color.fromRGBO(32, 80, 114, 0.08),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];
}