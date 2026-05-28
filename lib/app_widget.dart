import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projetoterceiro/data/http/http_client.dart';
import 'package:projetoterceiro/pages/home/home_page.dart';
import 'package:projetoterceiro/pages/login/login.dart';
import 'package:projetoterceiro/pages/login/usuario_page.dart';
import 'package:projetoterceiro/pages/splash_screen.dart';
import 'package:provider/provider.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return MultiProvider(
      providers: [
        Provider<Dio>.value(value: dio),
        ProxyProvider<Dio, DioClient>(update: (context, dio, dioClient) => DioClient(dio)),
      ],
      child: MaterialApp(
        title: 'Consumo de API',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => Login(),
          '/home': (context) => HomePage(),
          '/usuario': (context) => UsuarioPage(),
        },
      ),
    );
  }
}