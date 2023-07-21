import 'package:flutter/material.dart';
import 'package:model_number1/Controladores/Data_compartilhada.dart';
import 'package:model_number1/Telas/Login/Login_page.dart';
import 'package:model_number1/Telas/Menus/Exemplo_1.dart';
import 'package:model_number1/Telas/Menus/Exemplo_2.dart';
import 'package:model_number1/Telas/Menus/Exemplo_3.dart';
import 'package:model_number1/Telas/Menus/Exemplo_4.dart';
import 'package:model_number1/Telas/Menus/MenuPrincipal.dart';
class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ColorScheme colorScheme = ColorScheme.highContrastLight(
      primary: Color.fromARGB(255, 91, 102, 107),
      secondary: Colors.black,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    );

    final ThemeData themeData = ThemeData.from(
      colorScheme: colorScheme,
    );

    return AnimatedBuilder(
      animation: Appcontroller.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: themeData,
          initialRoute: "/",
          routes: {
            '/': (context) => const loginPage(),
            '/menu': (context) => const menuPage(),
            '/Ex1' :(context) => const Exemplo1(),
            '/Ex2' :(context) => const Exemplo2(),
            '/Ex3' :(context) => const Exemplo3(),
            '/Ex4' :(context) => Exemplo4()

          },
        );
      },
    );
  }
}