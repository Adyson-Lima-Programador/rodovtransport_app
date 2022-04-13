import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/servico_usuarios/usuarios_service.dart';
import 'package:rodovtransport_app/model/usuarios_model.dart';
import 'package:rodovtransport_app/view/usuarios_empresa_tile.dart';

class UsuariosEmpresa extends StatefulWidget {
  const UsuariosEmpresa({Key? key}) : super(key: key);

  @override
  State<UsuariosEmpresa> createState() => _UsuariosEmpresaState();
}

class _UsuariosEmpresaState extends State<UsuariosEmpresa> {
  int paginaAtual = 1;
  late Future<List<Usuario>> future;
  List<Usuario>? usuarios;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Só preenche future com método buscarTodos() no primeiro acesso,
    // depois preenche com método navegarPagina()
    if (paginaAtual == 1) {
      future = UsuariosService.buscarTodos();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xffffbd59),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Usuarios"),
          backgroundColor: const Color(0xffffbd59),
          foregroundColor: const Color(0xff424242),
          actions: [
            IconButton(
              onPressed: () => {_navega_para_pacotes()},
              icon: Icon(Icons.local_shipping_outlined),
            ),
            IconButton(
              onPressed: () => {_paginaAnterior()},
              icon: Icon(Icons.arrow_circle_left_outlined),
            ),
            IconButton(
              onPressed: () => {_proximaPagina()},
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
            IconButton(
              onPressed: () => {_novoUsuario()},
              icon: Icon(Icons.add_circle_outline_outlined),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _proximaPagina,
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FutureBuilder<List<Usuario>>(
                future: future,
                builder: (context, snapshot) {
                  usuarios = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: usuarios!.length,
                      itemBuilder: (context, i) =>
                          UsuariosEmpresaTile(usuarios!.elementAt(i)),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Não foi possivel buscar os usuários!');
                  }
                  return const CircularProgressIndicator(
                    color: Color(0xffffbd59),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navega_para_pacotes(){
    Navigator.of(context, rootNavigator: true).pushNamed("/pacotes_empresa");
  }

  Future<void> _paginaAnterior() async {
    if (mounted) {
      globalKey = GlobalKey();
      setState(() {
        if (paginaAtual > 1) {
          paginaAtual -= 1;
          future = UsuariosService.navegarPagina(paginaAtual);
        }
      });
    }
  }

  Future<void> _proximaPagina() async {
    if (mounted) {
      globalKey = GlobalKey();
      setState(() {
        if (paginaAtual < 5) {
          paginaAtual += 1;
          future = UsuariosService.navegarPagina(paginaAtual);
        }
      });
    }
  }

  _novoUsuario() {
    Navigator.of(context, rootNavigator: true).pushNamed("/usuarios_novo");
  }
}
