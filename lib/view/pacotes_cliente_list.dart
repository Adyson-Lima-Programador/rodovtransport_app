import 'package:flutter/material.dart';

class PacotesCliente extends StatefulWidget {
  const PacotesCliente({Key? key}) : super(key: key);

  @override
  State<PacotesCliente> createState() => _PacotesClienteState();
}

class _PacotesClienteState extends State<PacotesCliente> {
  @override
  Widget build(BuildContext context) {

    return Container();
  }

  exibeMensagem(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Bem vindo usuario!'),
          );
        });
  }
}

