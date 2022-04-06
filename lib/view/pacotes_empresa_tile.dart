import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';

class PacotesEmpresaTile extends StatelessWidget {
  final Pacote pacote;

  const PacotesEmpresaTile(this.pacote);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Descrição: " + pacote.content),
        subtitle: Text("Status: " +
            pacote.status +
            "\n" +
            "postado em: " +
            pacote.created_at),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.edit),
                color: const Color(0xffffbd59),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
