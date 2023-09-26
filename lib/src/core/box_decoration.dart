import 'package:flutter/material.dart';

const BoxDecoration kWSNeumorphicDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 32, 89, 106),
      Color.fromARGB(255, 65, 118, 114),
    ],
  ),
  boxShadow: [
    BoxShadow(
        color: Color.fromARGB(255, 0, 0, 0),
        offset: Offset(2, 2),
        spreadRadius: 0.5,
        blurRadius: 5),
    BoxShadow(
        color: Color.fromARGB(255, 90, 90, 90),
        offset: Offset(-1, -1),
        spreadRadius: 0.5,
        blurRadius: 5),
  ],
);
