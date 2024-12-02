// Importação do pacote Material do Flutter para widgets e controladores de texto
import 'package:flutter/material.dart';
// Importação do modelo de resultado de investimento
import 'resultado_investimento.dart';

// Classe que representa um Investimento
class Investimento {
  // Nome do investimento
  String nome;

  // Controladores de texto para diferentes campos do investimento
  TextEditingController capitalController; // Controla o campo de capital inicial
  TextEditingController aplicacaoController; // Controla o campo de aplicação mensal
  TextEditingController taxaJurosController; // Controla o campo de taxa de juros

  // Construtor da classe Investimento
  Investimento(this.nome,
      {
      // Parâmetros opcionais para inicializar os controladores
      String? capital,
      String? aplicacao,
      String? taxaJuros})
      :
        // Inicialização dos controladores com valores padrão
        capitalController = TextEditingController(text: capital),
        aplicacaoController = TextEditingController(text: aplicacao),
        taxaJurosController = TextEditingController(text: taxaJuros);

  // Método para calcular juros compostos
  ResultadoInvestimento calcularJurosCompostos(int meses) {
    // Converte os valores dos controladores para números
    double capital = double.parse(capitalController.text);
    double aplicacao = double.parse(aplicacaoController.text);
    double taxaJuros = double.parse(taxaJurosController.text) / 100;

    // Lista para armazenar detalhes de cada mês
    List<String> detalhes = [];

    // Loop para calcular juros compostos mês a mês
    for (int i = 1; i <= meses; i++) {
      // Calcula o rendimento do mês
      double rendimento = capital * taxaJuros;

      // Atualiza o capital adicionando rendimento e aplicação mensal
      capital += rendimento + aplicacao;

      // Adiciona detalhes do mês à lista
      detalhes.add('Mês $i: R\$ ${capital.toStringAsFixed(2)} (Rendimento: R\$ ${rendimento.toStringAsFixed(2)})');
    }

    // Retorna um objeto ResultadoInvestimento com os cálculos
    return ResultadoInvestimento(nome, capital, detalhes);
  }
}
