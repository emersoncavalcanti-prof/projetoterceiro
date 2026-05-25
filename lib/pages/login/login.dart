import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projetoterceiro/data/http/http_client.dart';
import 'package:projetoterceiro/data/models/user_model.dart';
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

  @override
  Widget build(BuildContext context) {

    final dioClient = Provider.of<DioClient>(context);
    UserStore store = UserStore(repository: UserRepository(client: dioClient));

    Future<void> login() async {
      if (_formKey.currentState!.validate()) {        

        final user = await store.login(email: controllerEmail.text, password: controllerSenha.text);
        if(!mounted) return;
        if(user != null){
          Navigator.pushReplacementNamed(context, '/home', arguments: user); 
        }
      }
    }
    
    return  Scaffold(
      appBar: AppBar(
        
        title: Text('Login',style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                controller: controllerEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomEdit(
                label: 'Senha',
                icone: Icon(Icons.lock),
                isObscure: true,
                controller: controllerSenha,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Entrar', style: TextStyle(fontSize: 18,color: Colors.white)),
                ),
              ),

              ValueListenableBuilder(
                valueListenable: store.error,
                builder: (context, errorMessage, child) {
                  if (errorMessage.isEmpty) {
                    return SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                  valueListenable: store.isLoading,
                  builder: (context, isLoading, child) {
                    if (!isLoading) {
                      return SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Lottie.asset(
                        'assets/animacoes/loading.json',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}