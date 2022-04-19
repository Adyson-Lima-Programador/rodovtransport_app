import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';
import 'package:rodovtransport_app/model/servico_pacotes/pacotes_service.dart';

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
            pacote.createdAt),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => {_editar(context, pacote)},
                icon: const Icon(Icons.edit),
                color: const Color(0xffffbd59),
              ),
              IconButton(
                onPressed: () => {_excluir(context)},
                icon: const Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }

  _editar(context, Pacote pacote) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed("/pacotes_atualizar", arguments: pacote);
  }

  _excluir(context) {
    showDialog(
        barrierDismissible: false, // só fecha dialogo pelos botões
        context: context,
        builder: (context) {
          PacotesService pacotesService = PacotesService();
          return AlertDialog(
            title: const Text("Atenção!"),
            content: const Text(
                'Esta ação não pode ser desfeita.Deseja continuar?'),
            actions: [
              ElevatedButton(
                  onPressed: () => {Navigator.pop(context, true)},
                  child: const Text("Não"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffbd59),
                    onPrimary: const Color(0xff424242),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        pacotesService.excluir(pacote.id),
                        Navigator.pop(context, true),
                      },
                  child: const Text("Sim"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffF44336),
                    onPrimary: const Color(0xff424242),
                  )),
            ],
          );
        });
  }
}
