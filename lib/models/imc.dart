import 'package:desafio_calculadora_imc/exceptions/custom_exceptions.dart';

import 'pessoa.dart';

enum ClassificacaoIMC {
  magrezaGrave,
  magrezaModerada,
  magrezaLeve,
  saudavel,
  sobrepeso,
  obesidadeGrauI,
  obesidadeGrauII,
  obesidadeGrauIII,
}

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0) {
    throw ValorInvalidoException();
  }
  var imc = pessoa.peso / (pessoa.altura * pessoa.altura);
  return double.parse(imc.toStringAsFixed(2));
}

String descricaoClassificacao(ClassificacaoIMC classificacao) {
  switch (classificacao) {
    case ClassificacaoIMC.magrezaGrave:
      return "Magreza Grave";
    case ClassificacaoIMC.magrezaModerada:
      return "Magreza Moderada";
    case ClassificacaoIMC.magrezaLeve:
      return "Magreza Leve";
    case ClassificacaoIMC.saudavel:
      return "Saudável";
    case ClassificacaoIMC.sobrepeso:
      return "Sobrepeso";
    case ClassificacaoIMC.obesidadeGrauI:
      return "Obesidade Grau I";
    case ClassificacaoIMC.obesidadeGrauII:
      return "Obesidade Grau II (severa)";
    case ClassificacaoIMC.obesidadeGrauIII:
      return "Obesidade Grau III (mórbida)";
  }
}

ClassificacaoIMC classificarIMC(double imc) {
  if (imc < 16.0) {
    return ClassificacaoIMC.magrezaGrave;
  } else if (imc < 17.0) {
    return ClassificacaoIMC.magrezaModerada;
  } else if (imc < 18.5) {
    return ClassificacaoIMC.magrezaLeve;
  } else if (imc < 24.9) {
    return ClassificacaoIMC.saudavel;
  } else if (imc < 29.9) {
    return ClassificacaoIMC.sobrepeso;
  } else if (imc < 34.9) {
    return ClassificacaoIMC.obesidadeGrauI;
  } else if (imc < 39.9) {
    return ClassificacaoIMC.obesidadeGrauII;
  } else {
    return ClassificacaoIMC.obesidadeGrauIII;
  }
}
