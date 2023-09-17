import 'dart:io';

import 'package:desafio_calculadora_imc/models/imc.dart';
import 'package:desafio_calculadora_imc/exceptions/custom_exceptions.dart';
import 'package:desafio_calculadora_imc/models/pessoa.dart';

void execute() {
  try {
    var pessoa = Pessoa.lerDadosDoUsuario();

    var imc = calcularIMC(pessoa);
    var classificacao = classificarIMC(imc);

    imprimirResultado(pessoa.nome, pessoa.peso, pessoa.altura, imc, classificacao);
  } on CampoEmBrancoException catch (e) {
    print(e.mensagem());
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }
}

void imprimirResultado(String nome, double peso, double altura, double imc, ClassificacaoIMC classificacao) {
  var descricao = descricaoClassificacao(classificacao);

  print("\nResultado do cálculo do IMC:");
  print("Nome: $nome");
  print("Peso: $peso kg");
  print("Altura: $altura m");
  print("IMC: $imc");
  print("Classificação: $descricao");
}

const String valorSaida = "0.1";
