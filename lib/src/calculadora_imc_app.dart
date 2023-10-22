import 'package:calculadora_imc_flutter_hive/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class CalculadoraImcApp extends StatelessWidget {
  const CalculadoraImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Calculadora IMC'),
    );
  }
}
