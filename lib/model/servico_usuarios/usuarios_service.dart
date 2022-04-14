import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:rodovtransport_app/model/usuarios_model.dart';

class UsuariosService {
  static Future<List<Usuario>> buscarTodos() async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    var url = Uri(
        scheme: 'http', host: '10.0.0.156', port: 3000, path: '/api/v2/users');

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final usuarios = <Usuario>[];
    for (Map map in list) {
      Usuario u = Usuario.fromJson(map);
      usuarios.add(u);
    }

    return usuarios;
  }

  static Future<List<Usuario>> buscarPorEmail(String email) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
        scheme: 'http',
        host: '10.0.0.156',
        port: 3000,
        path: '/api/v2/users/${email}');

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final usuarios = <Usuario>[];
    for (Map map in list) {
      Usuario u = Usuario.fromJson(map);
      usuarios.add(u);
    }

    return usuarios;
  }

  static Future<List<Usuario>> navegarPagina(int paginaAtual) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
      scheme: 'http',
      host: '10.0.0.156',
      port: 3000,
      path: "/api/v2/users",
      queryParameters: {'page': '${paginaAtual}'},
    );

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final usuarios = <Usuario>[];
    for (Map map in list) {
      Usuario u = Usuario.fromJson(map);
      usuarios.add(u);
    }

    return usuarios;
  }

  Future<bool> novo(
      String email, String name, String password, String category) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
        scheme: 'http', host: '10.0.0.156', port: 3000, path: '/api/v2/users');
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map params = {
      'email': email,
      'name': name,
      'password': password,
      'category': category
    };
    var usuario = convert.jsonEncode(params);

    await http.post(url, body: usuario, headers: headers);

    return true;
  }

  Future<bool> atualizar(int id, String email, String name, String password,
      String category) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users/id");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
        scheme: 'http',
        host: '10.0.0.156',
        port: 3000,
        path: '/api/v2/users/${id.toString()}');
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map params = {
      // 'id': id, não é necessário, gerá erro na api rails
      'email': email,
      'name': name,
      'password': password,
      'category': category
    };
    var usuario = convert.jsonEncode(params);

    await http.put(url, body: usuario, headers: headers);

    return true;
  }

  Future<bool> excluir(int id) async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/users/id");

    // Endereço IP deve ser verificado a cada inicialização do PC
    var url = Uri(
        scheme: 'http',
        host: '10.0.0.156',
        port: 3000,
        path: '/api/v2/users/${id}');
    final Map<String, String> headers = {"Content-Type": "application/json"};

    await http.delete(url, headers: headers);

    return true;
  }
}
