// Importação para usar o log de desenvolvimento
import 'dart:developer';

// Importações de widgets personalizados e páginas do aplicativo
import 'package:finance_app/common/widgets/custom_bottom_app_bar.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

// Importação das cores do aplicativo
import '../../common/constants/app_colors.dart';

// Widget StatefulWidget para a visualização principal da página inicial
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  // Cria o estado do widget
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

// Estado do HomePageView
class _HomePageViewState extends State<HomePageView> {
  // Controlador de página para navegação entre telas
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Adiciona um listener para monitorar a mudança de página
    // Imprime no log a posição atual da página
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Corpo da página usando PageView para navegação entre telas
      body: PageView(
        // Desativa a rolagem manual do PageView
        physics: const NeverScrollableScrollPhysics(),
        // Controlador de página
        controller: pageController,
        // Páginas que podem ser navegadas
        children: const [
          HomePage(), // Primeira página
          WalletPage(), // Segunda página
        ],
      ),
      // Posicionamento do botão flutuante
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Barra de navegação personalizada na parte inferior
      bottomNavigationBar: CustomBottomAppBar(
        // Cor do item selecionado
        selectedItemColor: AppColors.indigo,
        // Itens da barra de navegação
        children: [
          CustomBottomAppBarItem(
            label: 'wallet', // Rótulo do item
            primaryIcon: Icons.account_balance_wallet, // Ícone principal
            secondaryIcon: Icons.account_balance_wallet_outlined, // Ícone secundário
            // Ação ao pressionar (tentativa de ir para página 2, mas o índice parece incorreto)
            onPressed: () => pageController.jumpToPage(
              2, // NOTA: Este índice parece estar incorreto, deveria ser 1
            ),
          ),
        ],
      ),
    );
  }
}
