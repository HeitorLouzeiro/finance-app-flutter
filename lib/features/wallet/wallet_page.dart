import 'package:flutter/material.dart'; // Importa a biblioteca Flutter
import 'cadastro_investimento_page.dart'; // Importa a página de cadastro de investimentos
import 'comparacao_page.dart'; // Importa a página de comparação de investimentos
import '../models/investimento.dart'; // Importa o modelo de investimento
import '../models/resultado_investimento.dart'; // Importa o modelo de resultado de investimento

/// Classe principal da página de carteira de investimentos.
class WalletPage extends StatefulWidget {
  const WalletPage({super.key}); // Construtor padrão da classe

  @override
  State createState() => _WalletPageState(); // Define o estado da página
}

class _WalletPageState extends State<WalletPage> {
  // Classe interna para gerenciar o estado da página
  /// Controller para o campo de texto do período em meses.
  final TextEditingController _mesesController = TextEditingController();

  /// Lista para armazenar os investimentos cadastrados.
  final List<Investimento> _investimentos = [];

  @override
  Widget build(BuildContext context) {
    // Método responsável pela construção da interface
    return Scaffold(
      // Estrutura básica da página
      appBar: AppBar(
        // Barra superior da página
        title: const Text('Comparador de Investimentos'), // Título da barra superior
      ),
      body: Padding(
        // Espaçamento interno da página
        padding: const EdgeInsets.all(16.0), // Margens uniformes de 16 pixels
        child: Column(
          // Organiza os elementos verticamente
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha os itens no início da linha
          children: [
            // Lista de filhos da Column
            /// Título da seção de investimentos cadastrados.
            const Text(
              'Investimentos Cadastrados:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16), // Espaçamento entre o título e a lista

            /// Exibe os investimentos cadastrados em uma lista.
            Expanded(
              // Expande o espaço para ocupar todo o disponível
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

            /// Campo para inserir o período em meses.
            _campoTexto(
              controller: _mesesController,
              label: 'Período (meses)',
              tipoTeclado: TextInputType.number,
            ),
            const SizedBox(height: 16),

            /// Botões para adicionar e calcular investimentos.
            Row(
              // Organiza os botões lado a lado
              children: [
                Expanded(
                  // Distribui o espaço igualmente entre os botões
                  child: ElevatedButton(
                    onPressed: _adicionarInvestimento,
                    child: const Text('Adicionar Investimento'),
                  ),
                ),
                const SizedBox(width: 8), // Espaçamento entre os botões

                /// Botão para calcular e comparar os juros compostos.
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

  /// Widget para criar campos de texto reutilizáveis.
  Widget _campoTexto({
    required TextEditingController controller,
    required String label,
    TextInputType tipoTeclado = TextInputType.number,
  }) {
    // Método auxiliar para criar campos de texto personalizados
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

  /// Adiciona um novo investimento à lista e abre a página de cadastro.
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

  /// Edita um investimento existente na lista e abre a página de cadastro.
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

  /// Calcula os juros compostos para todos os investimentos e abre a página de comparação.
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

  /// Mostra uma mensagem de alerta ao usuário.
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
