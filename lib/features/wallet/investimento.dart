import 'package:flutter/material.dart';

import '../models/resultado_investimento.dart';

class ComparacaoPage extends StatelessWidget {
  final List<ResultadoInvestimento> resultados;

  const ComparacaoPage({super.key, required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação de Investimentos'),
      ),
      body: ListView.builder(
        itemCount: resultados.length,
        itemBuilder: (context, index) {
          final resultado = resultados[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resultado.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Montante Final: R\$ ${resultado.montanteFinal.toStringAsFixed(2)}'),
                  ExpansionTile(
                    title: const Text('Detalhes'),
                    children: resultado.detalhes.map((d) => Text(d)).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
