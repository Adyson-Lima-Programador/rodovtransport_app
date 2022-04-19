import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:rodovtransport_app/model/pacotes_model.dart';

class PacotesService {
  static Future<List<Pacote>> buscarTodos() async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/packages");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    // var url = Uri(
    //     scheme: 'http',
    //     host: '10.0.0.156',
    //     port: 3000,
    //     path: '/api/v2/packages');

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final pacotes = <Pacote>[];
    for (Map map in list) {
      Pacote p = Pacote.fromJson(map);
      pacotes.add(p);
    }

    return pacotes;
  }

  static Future<List<Pacote>> buscarPorEmail(String email) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/users/$email");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    // var url = Uri(
    //     scheme: 'http',
    //     host: '10.0.0.156',
    //     port: 3000,
    //     path: '/api/v2/users/$email');

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final pacotes = <Pacote>[];
    for (Map map in list) {
      Pacote p = Pacote.fromJson(map);
      pacotes.add(p);
    }

    return pacotes;
  }

  static Future<List<Pacote>> navegarPagina(int paginaAtual) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/packages?page=$paginaAtual");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    // var url = Uri(
    //   scheme: 'http',
    //   host: '10.0.0.156',
    //   port: 3000,
    //   path: "/api/v2/packages",
    //   queryParameters: {'page': '$paginaAtual'},
    // );

    var response = await http.get(url);
    String json = response.body;
    List list = convert.json.decode(json);

    final pacotes = <Pacote>[];
    for (Map map in list) {
      Pacote p = Pacote.fromJson(map);
      pacotes.add(p);
    }

    return pacotes;
  }

  Future<bool> novo(String content, String status, int userId) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/packages");

    // Endereço IP deve ser verificado a cada inicialização do PC
    // var url = Uri(
    //     scheme: 'http',
    //     host: '10.0.0.156',
    //     port: 3000,
    //     path: '/api/v2/packages');
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map params = {
      'content': content,
      'status': status,
      'user_id': userId
    };
    var pacote = convert.jsonEncode(params);

    await http.post(url, body: pacote, headers: headers);

    return true;
  }

  Future<bool> atualizar(
      int id, String content, String status, int userId) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/packages/${id.toString()}");

    // Endereço IP deve ser verificado a cada inicialização do PC
    // var url = Uri(
    //     scheme: 'http',
    //     host: '10.0.0.156',
    //     port: 3000,
    //     path: '/api/v2/packages/${id.toString()}');
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map params = {
      // 'id': id, não é necessário, gerá erro na api rails
      'content': content,
      'status': status,
      'user_id': userId
    };
    var pacote = convert.jsonEncode(params);

    await http.put(url, body: pacote, headers: headers);

    return true;
  }

  Future<bool> excluir(int id) async {
    // Padrão de url para produção
    var url = Uri.parse("https://rodovtransport.herokuapp.com/api/v2/packages/$id");

    // Endereço IP deve ser verificado a cada inicialização do PC
    // var url = Uri(
    //     scheme: 'http',
    //     host: '10.0.0.156',
    //     port: 3000,
    //     path: '/api/v2/packages/$id');
    final Map<String, String> headers = {"Content-Type": "application/json"};

    await http.delete(url, headers: headers);

    return true;
  }
}
