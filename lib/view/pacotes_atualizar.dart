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
  final userId = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    id = 0;
    content.dispose();
    status.dispose();
    userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // recebe objeto pacote enviado como arguments no Navigator
    final pacote = ModalRoute.of(context)?.settings.arguments as Pacote;

    // preenche formulário com dados do pacote enviado no Navigator
    id = pacote.id;
    content.text = pacote.content;
    status.text = pacote.status;
    userId.text = pacote.userId.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Pacote'),
        backgroundColor: const Color(0xffffbd59),
        foregroundColor: const Color(0xff424242),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    validator: (content) {
                      if (content == null || content.isEmpty) {
                        return "Digite uma descrição";
                      }
                      return null;
                    },
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
                    validator: (status) {
                      if (status == null || status.isEmpty) {
                        return "Digite um status";
                      }
                      return null;
                    },
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
                    controller: userId,
                    validator: (userId) {
                      if (userId == null || userId.isEmpty) {
                        return "Digite um número de usuário";
                      }
                      return null;
                    },
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
                          if (_formKey.currentState!.validate())
                            {
                              atualizar(id, content.text.trim(),
                                  status.text.trim(), userId.text.trim()),
                              limparForm(),
                            }
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

  void atualizar(id, content, status, userId) async {
    var pacotesService = PacotesService();
    await pacotesService.atualizar(id, content, status, int.parse(userId));
  }

  limparForm() {
    id = 0;
    content.text = '';
    status.text = '';
    userId.text = '';
  }
}
