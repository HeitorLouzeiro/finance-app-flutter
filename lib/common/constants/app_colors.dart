import 'package:flutter/material.dart';

class AppColors {
  /*
  Dessa forma, você pode definir todas as cores do aplicativo em um único arquivo e
  usá-las em todo o aplicativo.
  Dessa forma, se você precisar alterar a cor do aplicativo, você só precisa alterar o valor
  aqui e ele será refletido em todo o aplicativo.
  */
  /*
  Isso torna a classe um singleton (não pode ser instanciada) e privada (não pode ser herdada)
  A classe é privada para que ninguém possa instanciá-la e herdar dela.
  Podemos acessar as propriedades da classe diretamente sem instanciá-la.
  */
  AppColors._();

  static const Color primaryColor = Color(0xff4AAEE8);
  static const Color secondaryColor = Color(0xFF2D2D2D);

  static const List<Color> primaryGradient = [
    Color(0xff4AAEE8),
    Color(0xff2D2D2D),
  ];

  static const Color white = Color(0xFFFFFFFF);
  static const Color iceWhite = Color(0xFFF5F5F5);

  static const Color antiFlashWhite = Color(0xFFF0F6F5);
  static const Color darkGrey = Color(0xFF444444);
  static const Color grey = Color(0xFF666666);
  static const Color lightGrey = Color(0xFFAAAAAA);
  static const Color error = Color(0xFFF44336);
  static const Color green = Color(0xFF438883);
  static const Color darkGreen = Color(0xFF2F7E79);
  static const Color income = Color(0xFF25A969);
  static const Color outcome = Color(0xFFF95B51);
  static const Color notification = Color(0xFFFFAB7B);
}
