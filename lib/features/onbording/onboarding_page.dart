// Importações necessárias para estilização, navegação e componentes do Flutter
import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:flutter/material.dart';

// Declaração de um StatelessWidget para a página de onboarding
class OnboardingPage extends StatelessWidget {
  // Construtor constante com chave opcional
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Estrutura básica da página usando Scaffold
    return Scaffold(
      // Corpo centralizado com um Column para organizar os elementos verticalmente
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem ocupando 2/3 do espaço vertical
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.iceWhite, // Cor de fundo do container
                child: Image.asset('assets/images/man.png'), // Imagem importada
              ),
            ),

            // Espaçamento vertical
            const SizedBox(height: 20.0),

            // Título de boas-vindas
            const Text(
              'Bem-vindo ao Finance App',
              style: AppTextStyles.mediumText, // Estilo de texto definido em constantes
              textAlign: TextAlign.center,
            ),

            // Espaçamento vertical
            const SizedBox(height: 10.0),

            // Subtítulo explicativo
            const Text(
              'Descubra como é facil descobrir quanto o seu dinheiro pode render',
              style: AppTextStyles.mediumText,
              textAlign: TextAlign.center,
            ),

            // Espaçamento vertical
            const SizedBox(height: 30.0),

            // Botão para iniciar a navegação
            ElevatedButton(
              onPressed: () {
                // Navegação para a página inicial usando rotas nomeadas
                Navigator.pushNamed(context, NamedRoutes.home);
              },
              child: const Text('Começar'),
            ),

            // Espaçamento vertical final
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
