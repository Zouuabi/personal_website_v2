import 'package:flutter/material.dart';

import 'presentation/main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.white,
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.white,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white)),
      home: const HomePage(),
    );
  }
}
