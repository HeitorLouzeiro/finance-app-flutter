import 'package:finance_app/features/models/investimento.dart';
import 'package:flutter/material.dart';

class CadastroInvestimentoPage extends StatelessWidget {
  final Investimento? investimento;
  final void Function(Investimento) onSave;

  CadastroInvestimentoPage({super.key, this.investimento, required this.onSave});

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _aplicacaoController = TextEditingController();
  final TextEditingController _taxaJurosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (investimento != null) {
      _nomeController.text = investimento!.nome;
      _capitalController.text = investimento!.capitalController.text;
      _aplicacaoController.text = investimento!.aplicacaoController.text;
      _taxaJurosController.text = investimento!.taxaJurosController.text;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Investimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _campoTexto(controller: _nomeController, label: 'Nome do Investimento', tipoTeclado: TextInputType.text),
            _campoTexto(controller: _capitalController, label: 'Capital Inicial (R\$)'),
            _campoTexto(controller: _aplicacaoController, label: 'Aplicação Mensal (R\$)'),
            _campoTexto(controller: _taxaJurosController, label: 'Taxa de Juros Mensal (%)'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Investimento novoInvestimento = Investimento(
                  _nomeController.text,
                  capital: _capitalController.text,
                  aplicacao: _aplicacaoController.text,
                  taxaJuros: _taxaJurosController.text,
                );
                onSave(novoInvestimento);
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campoTexto({
    required TextEditingController controller,
    required String label,
    TextInputType tipoTeclado = TextInputType.number,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
