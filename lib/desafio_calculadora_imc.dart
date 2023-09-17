import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void execute() {
  print("Digite o nome da pessoa:");
  var nome = stdin.readLineSync();
  print(nome);

  print("Digite o peso (em kg):");
  var peso = stdin.readLineSync();
  print(peso);

  print("Digite a altura (em metros):");
  var altura = stdin.readLineSync();
  print(altura);
}
