import 'package:finance_app/features/models/investimento.dart'; // Importa o modelo de dados do investimento
import 'package:flutter/material.dart'; // Importa a biblioteca de widgets do Flutter

// Define a classe CadastroInvestimentoPage como um StatelessWidget
class CadastroInvestimentoPage extends StatelessWidget {
  // Declaração das variáveis que serão recebidas no construtor
  final Investimento?
      investimento; // O investimento a ser editado (nulo se for um novo investimento)
  final void Function(Investimento)
      onSave; // Função callback chamada ao salvar o investimento

  // Construtor da classe, recebendo o investimento e a função onSave
  CadastroInvestimentoPage(
      {super.key, this.investimento, required this.onSave});

  // Controladores de texto para os campos de entrada
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _aplicacaoController = TextEditingController();
  final TextEditingController _taxaJurosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Se estiver editando um investimento existente, preenche os campos com os dados do investimento
    if (investimento != null) {
      _nomeController.text = investimento!.nome;
      _capitalController.text = investimento!.capitalController.text;
      _aplicacaoController.text = investimento!.aplicacaoController.text;
      _taxaJurosController.text = investimento!.taxaJurosController.text;
    }

    // Constrói o layout da tela
    return Scaffold(
      appBar: AppBar(
        // Barra de título
        title: const Text('Cadastro de Investimento'),
      ),
      body: Padding(
        // Adiciona padding ao corpo da tela
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Widget para organizar os elementos verticalmente
          children: [
            // Lista de widgets filhos da Column
            // Campos de texto para nome, capital, aplicação e taxa de juros
            _campoTexto(
                controller: _nomeController,
                label: 'Nome do Investimento',
                tipoTeclado: TextInputType.text),
            _campoTexto(
                controller: _capitalController, label: 'Capital Inicial (R\$)'),
            _campoTexto(
                controller: _aplicacaoController,
                label: 'Aplicação Mensal (R\$)'),
            _campoTexto(
                controller: _taxaJurosController,
                label: 'Taxa de Juros Mensal (%)'),
            const SizedBox(height: 16), // Espaçamento vertical
            ElevatedButton(
              // Botão para salvar o investimento
              onPressed: () {
                // Função chamada ao pressionar o botão
                // Cria um novo objeto Investimento com os valores dos campos
                Investimento novoInvestimento = Investimento(
                  _nomeController.text,
                  capital: _capitalController.text,
                  aplicacao: _aplicacaoController.text,
                  taxaJuros: _taxaJurosController.text,
                );
                onSave(
                    novoInvestimento); // Chama a função onSave passando o novo investimento
                Navigator.pop(context); // Fecha a tela atual
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar um campo de texto com padding e label
  Widget _campoTexto({
    required TextEditingController controller, // Controlador do campo de texto
    required String label, // Label do campo
    TextInputType tipoTeclado =
        TextInputType.number, // Tipo de teclado (numérico por padrão)
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        // Widget para entrada de texto
        controller: controller,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          // Configura a decoração do campo
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
