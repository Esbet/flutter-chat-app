

import 'package:chatapp/global/enviroments.dart';
import 'package:chatapp/models/usuario.dart';
import 'package:chatapp/models/usuarios_response.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {

  Future<List<Usuario>> getUsuarios() async{
    try{
      
       String? token = await AuthService.getToken();
      final uri = Uri.parse('${Environment.apiUrl}/usuarios');
      final resp = await http.get(uri,headers: {'Content-Type': 'application/json', 'x-token': token.toString()});


      final usuariosResponse= usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;

    }catch(e){
      return [];
    }
  }

}