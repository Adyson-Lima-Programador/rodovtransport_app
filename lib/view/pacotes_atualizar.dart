import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/pacotes_model.dart';
import 'package:rodovtransport_app/model/servico_pacotes/pacotes_service.dart';

void main() => runApp(const PacotesAtualizar());

class PacotesAtualizar extends StatefulWidget {
  const PacotesAtualizar({Key? key}) : super(key: key);

  @override
  State<PacotesAtualizar> createState() => _AtualizarPacoteState();
}

class _AtualizarPacoteState extends State<PacotesAtualizar> {
  late int id;
  final content = TextEditingController();
  final status = TextEditingController();
  final user_id = TextEditingController();

  @override
  void dispose() {
    id = 0;
    content.dispose();
    status.dispose();
    user_id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // recebe objeto pacote enviado como arguments no Navigator
    final pacote = ModalRoute.of(context)?.settings.arguments as Pacote;

    // preenche formulário com dados do pacote enviado no Navigator
    this.id = pacote.id;
    this.content.text = pacote.content;
    this.status.text = pacote.status;
    this.user_id.text = pacote.user_id.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Pacote'),
        backgroundColor: const Color(0xffffbd59),
        foregroundColor: const Color(0xff424242),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    cursorColor: const Color(0xffffbd59),
                    controller: content,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Descrição',
                      labelStyle: TextStyle(
                        color: Color(0xffffbd59),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    cursorColor: const Color(0xffffbd59),
                    controller: status,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Status',
                      labelStyle: TextStyle(
                        color: Color(0xffffbd59),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    cursorColor: const Color(0xffffbd59),
                    controller: user_id,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Código do usuário',
                      labelStyle: TextStyle(
                        color: Color(0xffffbd59),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffffbd59),
                          onPrimary: const Color(0xff424242),
                        ),
                        child: const Text('Atualizar'),
                        onPressed: () => {
                          atualizar(this.id, content.text.trim(),
                              status.text.trim(), user_id.text.trim()),
                          limpar_form(),
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void atualizar(id, content, status, user_id) async {
    var pacotesService = PacotesService();
    await pacotesService.atualizar(id, content, status, int.parse(user_id));
  }

  limpar_form() {
    id = 0;
    content.text = '';
    status.text = '';
    user_id.text = '';
  }
}
