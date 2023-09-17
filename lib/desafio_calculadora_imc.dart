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
    var nome = stdin.readLineSync();
    if (nome == null || nome.isEmpty) {
      throw CampoEmBrancoException();
    }
    print(nome);

    print("Digite o peso (em kg):");
    var pesoInput = stdin.readLineSync();
    var peso = double.tryParse(pesoInput ?? "");
    if (peso == null || peso <= 0) {
      throw ValorInvalidoException();
    }
    print(peso);

    print("Digite a altura (em metros):");
    var alturaInput = stdin.readLineSync();
    var altura = double.tryParse(alturaInput ?? "");
    if (altura == null || altura <= 0) {
      throw ValorInvalidoException();
    }
    print(altura);
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
