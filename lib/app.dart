import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/features/home/home.dart';
import 'package:finance_app/features/onbording/onboarding_page.dart';
import 'package:finance_app/features/splash/spash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.home: (context) => const Home(),
      },
    );
  }
}
