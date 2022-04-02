import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AutenticacaoService {
  var categoria = '';
  var token = '';
  var erro_usuario = '';
  var erro_senha = '';

  Future<bool> loginJWT(String email, String password) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v1/auths");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
        scheme: 'http', host: '10.0.0.156', port: 3000, path: '/api/v1/auths');
    final Map params = {'email': email, 'password': password};

    var response = await http.post(url, body: params);

    categoria = response.body.substring(14, 15);
    token = response.body.substring(26, response.body.length - 2);
    erro_usuario = response.body.substring(9, response.body.length - 2);
    erro_senha = response.body.substring(9, response.body.length - 2);

    return true;
  }
}
