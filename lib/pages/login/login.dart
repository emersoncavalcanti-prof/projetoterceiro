import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projetoterceiro/data/http/http_client.dart';
import 'package:projetoterceiro/data/repositories/user_repository.dart';
import 'package:projetoterceiro/pages/login/store/user_store.dart';
import 'package:projetoterceiro/widget/custom_edit.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  bool clicou = false;

  @override
  Widget build(BuildContext context) {

    final dioClient = Provider.of<DioClient>(context);
    UserStore store = UserStore(repository: UserRepository(client: dioClient));
    
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