import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/usuarios_model.dart';
import 'package:rodovtransport_app/model/servico_usuarios/usuarios_service.dart';

class UsuariosEmpresaTile extends StatelessWidget {
  final Usuario usuario;

  const UsuariosEmpresaTile(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Nome: " + usuario.name),
        subtitle: Text("Email: " +
            usuario.email +
            "\n" +
            "categoria: " +
            usuario.category),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => {_editar(context, usuario)},
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

  _editar(context, Usuario usuario) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed("/usuarios_atualizar", arguments: usuario);
  }

  _excluir(context) {
    showDialog(
        barrierDismissible: false, // só fecha dialogo pelos botões
        context: context,
        builder: (context) {
          UsuariosService usuariosService = UsuariosService();
          return AlertDialog(
            title: Text("Atenção!"),
            content: Text('Esta ação não pode ser desfeita.Deseja continuar?'),
            actions: [
              ElevatedButton(
                  onPressed: () => {Navigator.pop(context, true)},
                  child: Text("Não"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffbd59),
                    onPrimary: const Color(0xff424242),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        usuariosService.excluir(usuario.id),
                        Navigator.pop(context, true),
                      },
                  child: Text("Sim"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffF44336),
                    onPrimary: const Color(0xff424242),
                  )),
            ],
          );
        });
  }
}
