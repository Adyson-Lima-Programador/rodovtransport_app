import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/usuarios_model.dart';
import 'package:rodovtransport_app/model/servico_usuarios/usuarios_service.dart';

void main() => runApp(const UsuariosAtualizar());

class UsuariosAtualizar extends StatefulWidget {
  const UsuariosAtualizar({Key? key}) : super(key: key);

  @override
  State<UsuariosAtualizar> createState() => _AtualizarUsuarioState();
}

class _AtualizarUsuarioState extends State<UsuariosAtualizar> {
  late int id;
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final category = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    id = 0;
    email.dispose();
    name.dispose();
    password.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // recebe objeto usuario enviado como arguments no Navigator
    final usuario = ModalRoute.of(context)?.settings.arguments as Usuario;

    // preenche formulário com dados do usuario enviado no Navigator
    id = usuario.id;
    email.text = usuario.email;
    name.text = usuario.name;
    password.text = usuario.password;
    category.text = usuario.category;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar usuário'),
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
                    controller: email,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Digite um email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Email',
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
                    controller: name,
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return "Digite um nome";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Nome',
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
                    controller: password,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return "Digite uma senha";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Senha',
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
                    controller: category,
                    validator: (category) {
                      if (category == null || category.isEmpty) {
                        return "Selecione categoria 1 ou 2";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xffffbd59),
                      )),
                      labelText: 'Categoria',
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
                              atualizar(
                                  id,
                                  email.text.trim(),
                                  name.text.trim(),
                                  password.text.trim(),
                                  category.text.trim()),
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

  void atualizar(int id, String email, String name, String password,
      String category) async {
    var usuariosService = UsuariosService();
    await usuariosService.atualizar(id, email, name, password, category);
  }

  limparForm() {
    id = 0;
    email.text = '';
    name.text = '';
    password.text = '';
    category.text = '';
  }
}
