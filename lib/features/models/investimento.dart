import 'package:flutter/material.dart';
import 'resultado_investimento.dart';

class Investimento {
  String nome;
  TextEditingController capitalController;
  TextEditingController aplicacaoController;
  TextEditingController taxaJurosController;

  Investimento(this.nome, {String? capital, String? aplicacao, String? taxaJuros})
      : capitalController = TextEditingController(text: capital),
        aplicacaoController = TextEditingController(text: aplicacao),
        taxaJurosController = TextEditingController(text: taxaJuros);

  ResultadoInvestimento calcularJurosCompostos(int meses) {
    double capital = double.parse(capitalController.text);
    double aplicacao = double.parse(aplicacaoController.text);
    double taxaJuros = double.parse(taxaJurosController.text) / 100;

    List<String> detalhes = [];
    for (int i = 1; i <= meses; i++) {
      double rendimento = capital * taxaJuros;
      capital += rendimento + aplicacao;
      detalhes.add('Mês $i: R\$ ${capital.toStringAsFixed(2)} (Rendimento: R\$ ${rendimento.toStringAsFixed(2)})');
    }

    return ResultadoInvestimento(nome, capital, detalhes);
  }
}
