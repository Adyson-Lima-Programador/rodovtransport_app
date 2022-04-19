import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';
import 'package:rodovtransport_app/model/servico_pacotes/pacotes_service.dart';
import 'package:rodovtransport_app/view/pacotes_cliente_tile.dart';

class PacotesCliente extends StatefulWidget {
  const PacotesCliente({Key? key}) : super(key: key);

  @override
  State<PacotesCliente> createState() => _PacotesClienteState();
}

class _PacotesClienteState extends State<PacotesCliente> {
  late Future<List<Pacote>> future;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var emailUsuarioLogado =
        ModalRoute.of(context)!.settings.arguments.toString();
    var email = emailUsuarioLogado.substring(1, emailUsuarioLogado.length - 1);
    future = PacotesService.buscarPorEmail(email);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xffffbd59),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pacotes Cliente"),
          backgroundColor: const Color(0xffffbd59),
          foregroundColor: const Color(0xff424242),
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
                        PacotesClienteTile(pacotes.elementAt(i)),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Não foi possivel buscar seus pacotes!');
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
