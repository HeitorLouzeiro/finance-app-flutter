import 'dart:async'; // Importa a biblioteca para usar o Timer

import 'package:finance_app/common/constants/app_colors.dart'; // Importa as cores do aplicativo
import 'package:finance_app/common/constants/app_text_styles.dart'; // Importa os estilos de texto
import 'package:finance_app/common/constants/routes.dart'; // Importa as rotas nomeadas
import 'package:finance_app/common/widgets/custom_circular_progress_indicator.dart'; // Importa um indicador de progresso circular personalizado
import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter

// Define o Widget StatefulWidget para a tela de splash
class SplashPage extends StatefulWidget {
  const SplashPage({super.key}); // Construtor da classe

  @override
  State<SplashPage> createState() => _SplashPageState(); // Cria o estado do Widget
}

// Define o State da SplashPage
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Método chamado quando o State é inicializado
    super.initState();
    init(); // Chama o método init para iniciar o timer
  }

  // Inicializa o timer para a navegação para a tela de onboarding
  Timer init() {
    // Retorna um Timer que executa a função navigateToOnboarding após 2 segundos
    return Timer(const Duration(seconds: 2), () {
      navigateToOnboarding();
    });
  }

  // Navega para a tela de onboarding
  void navigateToOnboarding() {
    // Usa o Navigator para navegar para a rota nomeada 'initial', substituindo a tela atual
    Navigator.pushReplacementNamed(
      context,
      NamedRoutes.initial,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface da tela
    return Scaffold(
      // Usa um Scaffold para fornecer uma estrutura básica
      body: Container(
        // Usa um Container para estilizar o corpo da tela
        alignment: Alignment.center, // Alinha o conteúdo ao centro
        decoration: const BoxDecoration(
          // Define a decoração do Container
          gradient: LinearGradient(
            // Usa um gradiente linear como fundo
            begin: Alignment.topCenter, // Define o início do gradiente
            end: Alignment.bottomCenter, // Define o fim do gradiente
            colors: AppColors.primaryGradient, // Usa as cores definidas em AppColors.primaryGradient
          ),
        ),
        child: Column(
          // Usa uma Column para organizar os widgets verticalmente
          mainAxisAlignment: MainAxisAlignment.center, // Alinha os filhos da Column ao centro
          children: [
            // Lista de widgets filhos da Column
            Text(
              // Exibe o texto 'Financy simulate'
              'Financy simulate',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white), // Aplica o estilo de texto definido em AppTextStyles.bigText e define a cor como branco
            ),
            const CustomCircularProgressIndicator(), // Exibe o indicador de progresso circular personalizado
          ],
        ),
      ),
    );
  }
}
