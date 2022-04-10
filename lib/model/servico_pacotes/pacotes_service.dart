import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:rodovtransport_app/model/pacotes_model.dart';

class PacotesService {
  static Future<List<Pacote>> buscarTodos() async {
    // Padrão de url para produção
    // var url = Uri.parse("http://localhost:3000/api/v2/packages");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    var url = Uri(
        scheme: 'http',
        host: '10.0.0.156',
        port: 3000,
        path: '/api/v2/packages');

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
    // var url = Uri.parse("http://localhost:3000/api/v2/users");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    var url = Uri(
        scheme: 'http',
        host: '10.0.0.156',
        port: 3000,
        path: '/api/v2/users/${email}');

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
    // var url = Uri.parse("http://localhost:3000/api/v2/packages");

    // Endereço IP deve ser verificado a cada inicialização do PC Dalia@rodovtransport.com
    var url = Uri(
      scheme: 'http',
      host: '10.0.0.156',
      port: 3000,
      path: "/api/v2/packages",
      queryParameters: {'page': '${paginaAtual}'},
    );

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
}
