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
                onPressed: () => {_editar(context)},
                icon: Icon(Icons.edit),
                color: const Color(0xffffbd59),
              ),
              IconButton(
                onPressed: () => {_excluir(context)},
                icon: Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
  
  _editar(context){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Editar'),
          );
        });
  }

  _excluir(context){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Excluir'),
          );
        });
  }
}
