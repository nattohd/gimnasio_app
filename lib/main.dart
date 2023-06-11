import 'package:flutter/material.dart';
import 'package:gimnasio_app/src/screens/screens.dart';
import 'config/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gimansio USM JMC',
      theme: MainTheme(selectedColor: 5).getTheme(),
      home: const LoginScreen(),
    );
  }
}
