import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';

class PacotesClienteTile extends StatelessWidget {

  final Pacote pacote;

  const PacotesClienteTile(this.pacote);

  @override
  Widget build(BuildContext context) {
        return Card(
      child: ListTile(
        title: Text("Descrição: " + pacote.content),
        subtitle: Text("Status: " +
            pacote.status +
            "\n" +
            "postado em: " +
            pacote.createdAt),
      ),
    );
  }
}
