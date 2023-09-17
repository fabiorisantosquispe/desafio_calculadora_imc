import 'dart:convert';
import 'dart:io';

import 'package:desafio_calculadora_imc/exceptions/custom_exceptions.dart';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? '';
  }

  static double? lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double lerDoubleComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerStringComTexto(texto);
        if (value == valorSaida) {
          return 0.1;
        }
        var parsedValue = double.tryParse(value);
        if (parsedValue != null && parsedValue > 0) {
          return parsedValue;
        }
        throw ValorInvalidoException();
      } catch (e) {
        print("Erro: Digite um valor válido.");
      }
    } while (true);
  }


  static double? lerDoubleConTexto(String texto) {
    print(texto);
    return lerDouble();
  }

  static Pessoa lerDadosDoUsuario() {
  var nome = lerStringComTexto("Digite o nome da pessoa:");
  if (nome.trim().isEmpty) {
    throw CampoEmBrancoException();
  }

  var peso = lerDoubleComTextoComSaida("Digite o peso (em kg):", "0.1");
  var altura = lerDoubleComTextoComSaida("Digite a altura (em metros):", "0.1");

  return Pessoa(nome, peso, altura);
}
}
