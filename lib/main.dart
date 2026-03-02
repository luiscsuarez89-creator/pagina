import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const ComputoBogotaApp());
}

class ComputoBogotaApp extends StatelessWidget {
  const ComputoBogotaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servicios de Cómputo Bogotá',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
