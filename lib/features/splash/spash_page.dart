import 'package:flutter/material.dart';

class SpashPage extends StatelessWidget {
  const SpashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff4AAEE8), // tem cololocar o 0xFF para funcionar
              Color(0xFF2D2D2D),
            ],
          ),
        ),
        child: const Text('Simulador de Juros Compostos', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
