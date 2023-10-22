import 'dart:math';

import 'package:hive/hive.dart';

part 'imc.g.dart';

@HiveType(typeId: 0)
class Imc extends HiveObject {
  @HiveField(0)
  final int peso;
  @HiveField(1)
  final int altura;

  Imc(this.peso, this.altura);

  get indice {
    return (peso / pow(altura / 100, 2)).toStringAsFixed(1);
  }

  String calcular() {
    return (peso / pow(altura / 100, 2)).toStringAsFixed(1);
  }

  String classificar() {
    double imc = double.parse(indice);
    if (imc < 16) return "Magreza grave";
    if (imc < 17) return "Magreza moderada";
    if (imc < 18.5) return "Magreza moderada";
    if (imc < 25) return "Saudável";
    if (imc < 30) return "Sobrepeso";
    if (imc < 35) return "Obesidade grau 1";
    if (imc < 40) return "Obesidade grau 2";

    return "Obesidade grau 3";
  }
}
