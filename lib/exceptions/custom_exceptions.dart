class CampoEmBrancoException implements Exception {
  String mensagem() => "O campo não pode ficar em branco.";
}

class ValorInvalidoException implements Exception {
  String mensagem() => "Digite um valor válido maior que zero.";
}
