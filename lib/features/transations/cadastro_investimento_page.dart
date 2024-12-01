import 'package:flutter/material.dart';

import '../../common/widgets/custom_form_transations.dart';
import 'investimento.dart';

class CadastroInvestimentoPage extends StatelessWidget {
  final Investimento? investimento; // Para edição (se houver)
  final void Function(Investimento)? onSave; // Torne onSave opcional

  CadastroInvestimentoPage({
    super.key,
    this.investimento,
    this.onSave, // Removido o required
  });

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _aplicacaoController = TextEditingController();
  final TextEditingController _taxaJurosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Preenche os campos se estiver editando um investimento existente
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
            CampoTexto(
              controller: _nomeController,
              label: 'Nome do Investimento',
              tipoTeclado: TextInputType.text,
            ),
            CampoTexto(
              controller: _capitalController,
              label: 'Capital Inicial (R\$)',
            ),
            CampoTexto(
              controller: _aplicacaoController,
              label: 'Aplicação Mensal (R\$)',
            ),
            CampoTexto(
              controller: _taxaJurosController,
              label: 'Taxa de Juros Mensal (%)',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Cria um novo investimento ou atualiza o existente
                Investimento novoInvestimento = Investimento(
                  _nomeController.text,
                  capital: _capitalController.text,
                  aplicacao: _aplicacaoController.text,
                  taxaJuros: _taxaJurosController.text,
                );

                // Chama a função onSave para persistir o investimento, se não for nulo
                if (onSave != null) {
                  onSave!(novoInvestimento);
                }

                // Volta para a tela anterior
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
