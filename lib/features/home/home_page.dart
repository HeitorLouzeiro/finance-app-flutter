// Importação do pacote principal do Flutter para widgets
import 'package:flutter/material.dart';

// Definição do widget de página inicial como StatefulWidget
class HomePage extends StatefulWidget {
  // Construtor const com chave opcional
  const HomePage({super.key});

  // Método para criar o estado do widget
  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado da HomePage que usa o mixin AutomaticKeepAliveClientMixin
// Isso mantém o estado do widget preservado mesmo quando não está visível
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  // Método que define se o estado deve ser mantido vivo
  @override
  bool get wantKeepAlive => true;

  // Método build para construir a interface da página
  @override
  Widget build(BuildContext context) {
    // Chama o método build do pai (necessário quando usa AutomaticKeepAliveClientMixin)
    super.build(context);

    // Retorna um Scaffold com um texto centralizado
    return const Scaffold(
      body: Center(
        child: Text("Clique no botão 'wallet' para ir para a página de carteira"),
      ),
    );
  }
}
