import 'package:test/test.dart';
import 'package:desafio_calculadora_imc/models/imc.dart';
import 'package:desafio_calculadora_imc/models/pessoa.dart';
import 'package:desafio_calculadora_imc/exceptions/custom_exceptions.dart';

void main() {
  group('Cálculo do IMC', () {
    test('Calcula o IMC corretamente', () {
      final pessoa = Pessoa('João', 75.0, 1.75);
      final imc = calcularIMC(pessoa);

      expect(imc, closeTo(24.49, 0.01));
    });

    test('Classifica o IMC corretamente', () {
      final imcs = {
        15.0: ClassificacaoIMC.magrezaGrave,
        16.5: ClassificacaoIMC.magrezaModerada,
        18.0: ClassificacaoIMC.magrezaLeve,
        22.5: ClassificacaoIMC.saudavel,
        27.5: ClassificacaoIMC.sobrepeso,
        33.5: ClassificacaoIMC.obesidadeGrauI,
        38.5: ClassificacaoIMC.obesidadeGrauII,
        45.0: ClassificacaoIMC.obesidadeGrauIII,
      };

      imcs.forEach((imc, classificacaoEsperada) {
        final classificacao = classificarIMC(imc);
        expect(classificacao, equals(classificacaoEsperada));
      });
    });

    test('Lança exceção para altura inválida', () {
      final pessoa = Pessoa('Maria', 60.0, 0);

      expect(() => calcularIMC(pessoa), throwsA(TypeMatcher<ValorInvalidoException>()));
    });
  });

  group('Cálculo do IMC para diferentes cenários', () {
    test('Calcula o IMC corretamente para uma pessoa saudável', () {
      var pessoa = Pessoa('João', 70.0, 1.75);
      var expectedIMC = 22.86;
      var actualIMC = calcularIMC(pessoa);
      expect(actualIMC, equals(expectedIMC));
    });

    test('Calcula o IMC corretamente para uma pessoa com baixo peso', () {
      var pessoa = Pessoa('Maria', 50.0, 1.70);
      var expectedIMC = 17.30;
      var actualIMC = calcularIMC(pessoa);
      expect(actualIMC, equals(expectedIMC));
    });

    test('Calcula o IMC corretamente para uma pessoa com sobrepeso', () {
      var pessoa = Pessoa('Carlos', 90.0, 1.80);
      var expectedIMC = 27.78;
      var actualIMC = calcularIMC(pessoa);
      expect(actualIMC, equals(expectedIMC));
    });
  });
}
