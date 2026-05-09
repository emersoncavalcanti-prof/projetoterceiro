import 'package:flutter/material.dart';
import 'package:projetoterceiro/pages/login.dart';
import 'package:projetoterceiro/pages/splash_screen.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de API',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
      },
    );
  }
}