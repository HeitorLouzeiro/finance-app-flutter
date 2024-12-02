// Definição de uma classe imutável que representa o resultado de um investimento
class ResultadoInvestimento {
  // Nome identificador do investimento (final indica que não pode ser alterado após a inicialização)
  final String nome;

  // Montante final do investimento, representando o valor total após o período de investimento
  final double montanteFinal;

  // Lista de detalhes adicionais sobre o investimento (podem ser informações complementares)
  final List<String> detalhes;

  // Construtor da classe que inicializa os atributos com os valores passados
  // Utiliza a sintaxe de construtor simplificada do Dart
  ResultadoInvestimento(this.nome, this.montanteFinal, this.detalhes);
}
