import 'dart:convert';
import 'dart:io';

import 'exceptions/custom_exceptions.dart';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void execute() {
  try {
    print("Digite o nome da pessoa:");
    var nome = stdin.readLineSync(encoding: utf8);
    if (nome == null || nome.isEmpty) {
      throw CampoEmBrancoException();
    }

    print("Digite o peso (em kg):");
    var pesoInput = stdin.readLineSync();
    var peso = double.tryParse(pesoInput ?? "");
    if (peso == null || peso <= 0) {
      throw ValorInvalidoException();
    }

    print("Digite a altura (em metros):");
    var alturaInput = stdin.readLineSync();
    var altura = double.tryParse(alturaInput ?? "");
    if (altura == null || altura <= 0) {
      throw ValorInvalidoException();
    }

    var imc = calcularIMC(peso, altura);
    var classificacao = classificarIMC(imc);

    print("\nResultado do cálculo do IMC:");
    print("Nome: $nome");
    print("Peso: $peso kg");
    print("Altura: $altura m");
    print("IMC: $imc");
    print("Classificação: $classificacao");

  } catch (e) {
    if (e is CampoEmBrancoException) {
      print("Erro: ${e.mensagem()}");
    } else if (e is ValorInvalidoException) {
      print("Erro: ${e.mensagem()}");
    } else {
      print("Erro desconhecido: $e");
    }
  }
}

double calcularIMC(double peso, double altura) {
  if (altura <= 0) {
    throw ValorInvalidoException();
  }
  return peso / (altura * altura);
}

String classificarIMC(double imc) {
  if (imc < 16) {
    return "Magreza Grave";
  } else if (imc < 17) {
    return "Magreza Moderada";
  } else if (imc < 18.5) {
    return "Magreza Leve";
  } else if (imc < 25) {
    return "Saudável";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else if (imc < 35) {
    return "Obesidade Grau I";
  } else if (imc < 40) {
    return "Obesidade Grau II (severa)";
  } else {
    return "Obesidade Grau III (mórbida)";
  }
}
