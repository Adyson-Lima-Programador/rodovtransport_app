import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';
import 'package:rodovtransport_app/model/servico_pacotes/pacotes_service.dart';
import 'package:rodovtransport_app/routes.dart';
import 'package:rodovtransport_app/view/pacotes_empresa_tile.dart';
import 'package:rodovtransport_app/view/pacotes_novo.dart';

class PacotesEmpresa extends StatefulWidget {
  const PacotesEmpresa({Key? key}) : super(key: key);

  @override
  State<PacotesEmpresa> createState() => _PacotesEmpresaState();
}

class _PacotesEmpresaState extends State<PacotesEmpresa> {
  int paginaAtual = 1;
  late Future<List<Pacote>> future;
  List<Pacote>? pacotes;
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
      future = PacotesService.buscarTodos();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xffffbd59),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pacotes"),
          backgroundColor: const Color(0xffffbd59),
          foregroundColor: const Color(0xff424242),
          actions: [
            IconButton(
              onPressed: () => {_paginaAnterior()},
              icon: Icon(Icons.arrow_circle_left_outlined),
            ),
            IconButton(
              onPressed: () => {_proximaPagina()},
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
            IconButton(
              onPressed: () => {_novoPacote()},
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
              child: FutureBuilder<List<Pacote>>(
                future: future,
                builder: (context, snapshot) {
                  pacotes = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: pacotes!.length,
                      itemBuilder: (context, i) =>
                          PacotesEmpresaTile(pacotes!.elementAt(i)),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Não foi possivel buscar os pacotes!');
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

  Future<void> _paginaAnterior() async {
    if (mounted) {
      globalKey = GlobalKey();
      setState(() {
        if (paginaAtual > 1) {
          paginaAtual -= 1;
          future = PacotesService.navegarPagina(paginaAtual);
        }
      });
    }
  }

  Future<void> _proximaPagina() async {
    if (mounted) {
      globalKey = GlobalKey();
      setState(() {
        if (paginaAtual < 15) {
          paginaAtual += 1;
          future = PacotesService.navegarPagina(paginaAtual);
        }
      });
    }
  }

  _novoPacote() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => PacotesNovo()));
  }
}
