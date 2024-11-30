import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/man.png'),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Bem-vindo ao Finance App',
              style: AppTextStyles.mediumText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Descubra como é facil descobrir para onde vai seu dinheiro',
              style: AppTextStyles.mediumText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão
              },
              child: const Text('Começar'),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
