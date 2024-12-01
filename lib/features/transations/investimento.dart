import 'package:flutter/material.dart';

class Investimento {
  String nome;
  TextEditingController capitalController;
  TextEditingController aplicacaoController;
  TextEditingController taxaJurosController;

  Investimento(
    this.nome, {
    String? capital,
    String? aplicacao,
    String? taxaJuros,
  })  : capitalController = TextEditingController(text: capital),
        aplicacaoController = TextEditingController(text: aplicacao),
        taxaJurosController = TextEditingController(text: taxaJuros);

  ResultadoInvestimento calcularJurosCompostos(int meses) {
    double capital = double.tryParse(capitalController.text) ?? 0.0;
    double aplicacao = double.tryParse(aplicacaoController.text) ?? 0.0;
    double taxaJuros = double.tryParse(taxaJurosController.text) ?? 0.0 / 100;

    List<String> detalhes = [];
    for (int i = 1; i <= meses; i++) {
      double rendimento = capital * taxaJuros;
      capital += rendimento + aplicacao;
      detalhes.add('Mês $i: R\$ ${capital.toStringAsFixed(2)} (Rendimento: R\$ ${rendimento.toStringAsFixed(2)})');
    }

    return ResultadoInvestimento(nome, capital, detalhes);
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'capital': capitalController.text,
      'aplicacao': aplicacaoController.text,
      'taxaJuros': taxaJurosController.text,
    };
  }

  factory Investimento.fromMap(Map<String, dynamic> map) {
    return Investimento(
      map['nome'] as String,
      capital: map['capital'] as String?,
      aplicacao: map['aplicacao'] as String?,
      taxaJuros: map['taxaJuros'] as String?,
    );
  }
}

class ResultadoInvestimento {
  final String nome;
  final double montanteFinal;
  final List<String> detalhes;

  ResultadoInvestimento(this.nome, this.montanteFinal, this.detalhes);
}
