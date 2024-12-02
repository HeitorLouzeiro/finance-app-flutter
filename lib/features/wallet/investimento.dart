import 'package:flutter/material.dart'; // Importa a biblioteca de widgets Material Design do Flutter

import '../models/resultado_investimento.dart'; // Importa o modelo de dados ResultadoInvestimento

// Define o widget ComparacaoPage como um StatelessWidget, o que significa que ele não gerencia
// estado interno.
class ComparacaoPage extends StatelessWidget {
  // Declara a variável resultados, que recebe uma lista de objetos ResultadoInvestimento.
  // Esta lista contém os dados que serão exibidos na página.
  final List<ResultadoInvestimento> resultados;

  // Construtor da classe ComparacaoPage. Ele recebe a lista de resultados como um parâmetro
  // obrigatório (required). A chave `key` é usada pelo Flutter para identificar widgets na árvore.
  const ComparacaoPage({super.key, required this.resultados});

  @override
  Widget build(BuildContext context) {
    // Este método constrói a interface do usuário da página.
    return Scaffold(
      // O widget Scaffold fornece uma estrutura básica para a página, incluindo AppBar e corpo.
      appBar: AppBar(
        // Define o AppBar, a barra superior da página.
        title: const Text('Comparação de Investimentos'), // Define o título do AppBar.
      ),
      body: ListView.builder(
        // Usa um ListView.builder para criar uma lista rolável de itens.
        itemCount: resultados.length, // Define o número de itens na lista, com base no tamanho da lista de resultados.
        itemBuilder: (context, index) {
          // Função que constrói cada item da lista.
          // Obtém o ResultadoInvestimento correspondente ao índice atual.
          final resultado = resultados[index];
          // Retorna um Card widget para cada resultado. O Card cria um visual de cartão com cantos arredondados e sombra.
          return Card(
            child: Padding(
              // Adiciona padding (espaçamento interno) ao conteúdo do Card.
              padding: const EdgeInsets.all(16.0), // Padding de 16.0 em todos os lados.
              child: Column(
                // Organiza os widgets filhos verticalmente.
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos da Column à esquerda.
                children: [
                  // Lista de widgets filhos da Column.
                  Text(
                    // Widget de texto para exibir o nome do investimento.
                    resultado.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Define o estilo do texto (negrito e tamanho 16).
                  ),
                  Text('Montante Final: R\$ ${resultado.montanteFinal.toStringAsFixed(2)}'), // Widget de texto para exibir o montante final, formatado com duas casas decimais.
                  ExpansionTile(
                    // Widget expansível para exibir detalhes adicionais.
                    title: const Text('Detalhes'), // Título da ExpansionTile.
                    // Mapeia a lista de detalhes do resultado para uma lista de widgets Text.
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
