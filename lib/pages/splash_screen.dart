import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            Lottie.asset(
              'assets/animacoes/cart.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              'Carregando...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Lottie.asset('assets/animacoes/loading.json',
                width: 100, height: 100, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}