import 'package:flutter/material.dart';
import 'cadastro_investimento_page.dart';
import 'comparacao_page.dart';
import '../models/investimento.dart';
import '../models/resultado_investimento.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State createState() => _WalletPageState();
}

class _WalletPageState extends State {
  final TextEditingController _mesesController = TextEditingController();
  final List<Investimento> _investimentos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Investimentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Investimentos Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _investimentos.isEmpty
                  ? const Center(child: Text('Nenhum investimento cadastrado.'))
                  : ListView.builder(
                      itemCount: _investimentos.length,
                      itemBuilder: (context, index) {
                        final investimento = _investimentos[index];
                        return ListTile(
                          title: Text(investimento.nome),
                          subtitle: Text('Capital: R\$ ${investimento.capitalController.text} | Taxa: ${investimento.taxaJurosController.text}%'),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _editarInvestimento(index);
                            },
                          ),
                        );
                      },
                    ),
            ),
            _campoTexto(
              controller: _mesesController,
              label: 'Período (meses)',
              tipoTeclado: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _adicionarInvestimento,
                    child: const Text('Adicionar Investimento'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calcularJurosCompostos,
                    child: const Text('Calcular e Comparar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Widget para criar campos de texto reutilizáveis
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

  /// Adicionar um novo investimento
  void _adicionarInvestimento() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroInvestimentoPage(
          onSave: (investimento) {
            setState(() {
              _investimentos.add(investimento);
            });
          },
        ),
      ),
    );
  }

  /// Editar um investimento existente
  void _editarInvestimento(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroInvestimentoPage(
          investimento: _investimentos[index],
          onSave: (investimentoEditado) {
            setState(() {
              _investimentos[index] = investimentoEditado;
            });
          },
        ),
      ),
    );
  }

  /// Calcular os juros compostos
  void _calcularJurosCompostos() {
    if (_mesesController.text.isEmpty || _investimentos.isEmpty) {
      _mostrarAlerta('Por favor, preencha todos os campos e adicione pelo menos um investimento!');
      return;
    }

    int meses = int.parse(_mesesController.text);
    List<ResultadoInvestimento> resultados = _investimentos.map((investimento) {
      return investimento.calcularJurosCompostos(meses);
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComparacaoPage(resultados: resultados),
      ),
    );
  }

  /// Mostrar alerta
  void _mostrarAlerta(String mensagem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Atenção'),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
