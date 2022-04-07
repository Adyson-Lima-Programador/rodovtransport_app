import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';
import 'package:rodovtransport_app/model/servico_pacotes/pacotes_service.dart';
import 'package:rodovtransport_app/view/pacotes_empresa_tile.dart';

class PacotesEmpresa extends StatefulWidget {
  const PacotesEmpresa({Key? key}) : super(key: key);

  @override
  State<PacotesEmpresa> createState() => _PacotesEmpresaState();
}

class _PacotesEmpresaState extends State<PacotesEmpresa> {
  late Future<List<Pacote>> future;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    future = PacotesService.buscarTodos();

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
              onPressed: () => {_retornar()},
              icon: Icon(Icons.arrow_circle_left_outlined),
            ),
            IconButton(
              onPressed: () => {_proximo()},
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
            IconButton(
              onPressed: () => {_novoPacote()},
              icon: Icon(Icons.add_circle_outline_outlined),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FutureBuilder<List<Pacote>>(
              future: future,
              builder: (context, snapshot) {
                List<Pacote>? pacotes = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: pacotes!.length,
                    itemBuilder: (context, i) =>
                        PacotesEmpresaTile(pacotes.elementAt(i)),
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
    );
  }

  _retornar() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Lista anterior'),
          );
        });
  }

  _proximo() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Próxima lista'),
          );
        });
  }

  _novoPacote() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Novo pacote'),
          );
        });
  }
}
