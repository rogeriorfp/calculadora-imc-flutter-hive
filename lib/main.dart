import 'package:calculadora_imc_flutter_hive/src/models/imc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/calculadora_imc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('data');
  Hive.registerAdapter(ImcAdapter());
  runApp(const CalculadoraImcApp());
}
