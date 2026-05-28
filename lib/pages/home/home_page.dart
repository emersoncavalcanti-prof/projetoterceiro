import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projetoterceiro/data/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
         appBar: AppBar(
        
        title: Text('Home Page',style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: Image.network(
                          'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Picture.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    Text(
                      'Bem vindo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      user.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Usuários'),
              onTap: () {
                Navigator.pushNamed(context, '/usuario');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Produtos'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animacoes/cart.json',
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}