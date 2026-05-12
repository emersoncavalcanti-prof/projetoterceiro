import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projetoterceiro/app_widget.dart';
import 'package:projetoterceiro/widget/custom_edit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: Text('Login',style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/animacoes/cart.json',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
            CustomEdit(
              label: 'Usuário',
              icone: Icon(Icons.person),
            ),
            SizedBox(height: 20),
            CustomEdit(
              label: 'Senha',
              icone: Icon(Icons.lock),
              isObscure: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Entrar', style: TextStyle(fontSize: 18,color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}