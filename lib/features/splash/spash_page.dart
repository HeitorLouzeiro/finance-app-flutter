import 'dart:async';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:finance_app/features/onbording/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  // Inicializa o timer para a navegação para a tela de onboarding
  Timer init() {
    return Timer(const Duration(seconds: 2), () {
      navigateToOnboarding();
    });
  }

  // Navega para a tela de onboarding
  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoutes.initial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.primaryGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Financy simulate',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
