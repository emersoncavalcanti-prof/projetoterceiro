import 'package:projetoterceiro/data/http/http_client.dart';
import 'package:projetoterceiro/data/http/endpoints.dart';
import 'package:projetoterceiro/data/models/user_model.dart';

class UserRepository{

  final IHttpClient client;

  UserRepository(this.client);

  Future<UserModel> login(Map<String, dynamic> data) async {
    final response = await client.post(
      url: '${Endpoints.baseUrl}/login', 
      data: data);
    
    if(response.statusCode == 200){
      final body = response.data;

      if(body is Map<String, dynamic>){
        UserModel user = UserModel.fromMap(body);
        return user;
      }else{
        throw FormatException('Resposta inesperada do servidor');
      }
    }else if(response.statusCode == 401){
      throw Exception('Credenciais inválidas');   
    }else if(response.statusCode == 404){
      throw Exception('Endpoint não encontrado');
    }else{
      throw Exception('Erro desconhecido: ${response.statusCode}'); 
    }

  }

}