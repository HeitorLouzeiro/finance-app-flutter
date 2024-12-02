import 'package:flutter/material.dart'; // Importa widgets Material Design
import '../models/resultado_investimento.dart'; // Importa o modelo ResultadoInvestimento

// Define a classe ComparacaoPage como um StatelessWidget
class ComparacaoPage extends StatelessWidget {
  // Uma lista de objetos ResultadoInvestimento para exibir
  final List<ResultadoInvestimento> resultados;

  // Construtor que recebe a lista de resultados
  const ComparacaoPage({super.key, required this.resultados});

  @override
  Widget build(BuildContext context) {
    // Constrói a interface da página
    return Scaffold(
      appBar: AppBar(
        // Define o AppBar
        title: const Text('Comparação de Investimentos'), // Título do AppBar
      ),
      body: ListView.builder(
        // Usa um ListView.builder para criar uma lista rolável
        itemCount: resultados.length, // Define o número de itens na lista
        itemBuilder: (context, index) {
          // Função que constrói cada item da lista
          final resultado = resultados[index]; // Obtém o ResultadoInvestimento atual
          return Card(
            // Exibe cada resultado em um Card
            child: Padding(
              // Adiciona padding dentro do Card
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // Organiza os elementos verticalmente dentro do Card
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                children: [
                  // Lista de widgets dentro da Column
                  Text(
                    // Exibe o nome do investimento
                    resultado.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Estilo do texto
                  ),
                  Text('Montante Final: R\$ ${resultado.montanteFinal.toStringAsFixed(2)}'), // Exibe o montante final formatado
                  ExpansionTile(
                    // Widget expansível para mostrar detalhes
                    title: const Text('Detalhes'), // Título da seção expansível
                    children: resultado.detalhes.map((d) => Text(d)).toList(), // Mapeia a lista de detalhes para widgets Text
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
