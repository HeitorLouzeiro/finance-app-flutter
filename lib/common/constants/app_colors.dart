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
}
