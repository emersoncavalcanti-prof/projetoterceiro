import 'package:flutter/material.dart';
import 'package:projetoterceiro/data/http/http_client.dart';
import 'package:projetoterceiro/data/repositories/user_repository.dart';
import 'package:projetoterceiro/pages/login/store/user_store.dart';
import 'package:provider/provider.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {

  
  @override
  Widget build(BuildContext context) {

  final dioClient = Provider.of<DioClient>(context);
  UserStore store = UserStore(repository: UserRepository(client: dioClient));

  store.getUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário',style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: store.isLoading,
            builder: (context, isLoading, child) {
              if(isLoading){
                return CircularProgressIndicator();
              }
              return SizedBox.shrink();
            },
          ),
          ValueListenableBuilder(
            valueListenable: store.error,
            builder: (context, error, child) {
              if(error.isNotEmpty){
                return Text(error);
              }
              return SizedBox.shrink();
            },
          ),
          ValueListenableBuilder(
            valueListenable: store.state,
            builder: (context, users, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Picture.png'),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}