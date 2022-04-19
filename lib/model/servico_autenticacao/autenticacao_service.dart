import 'package:http/http.dart' as http;

class AutenticacaoService {
  var categoria = '';
  var token = '';
  var erroUsuario = '';
  var erroSenha = '';
  var emailUsuario = '';

  Future<bool> loginJWT(String email, String password) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v1/auths");

    // Endereço IP deve ser verificado a cada inicialização do PC
    // var url = Uri(
    //     scheme: 'http', host: '10.0.0.156', port: 3000, path: '/api/v1/auths');

    final Map params = {'email': email, 'password': password};

    var response = await http.post(url, body: params);

    categoria = response.body.substring(14, 15);
    token = response.body.substring(26, response.body.length - 2);
    erroUsuario = response.body.substring(9, response.body.length - 2);
    erroSenha = response.body.substring(9, response.body.length - 2);
    emailUsuario = email;

    return true;
  }
}
