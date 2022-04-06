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
          title: const Text("Pacotes Empresa"),
          backgroundColor: const Color(0xffffbd59),
          foregroundColor: const Color(0xff424242),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.add),
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
}