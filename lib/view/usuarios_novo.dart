import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/servico_usuarios/usuarios_service.dart';

void main() => runApp(const UsuariosNovo());

class UsuariosNovo extends StatefulWidget {
  const UsuariosNovo({Key? key}) : super(key: key);

  @override
  State<UsuariosNovo> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<UsuariosNovo> {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final category = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuário'),
        backgroundColor: const Color(0xffffbd59),
        foregroundColor: const Color(0xff424242),
      ),
      body: Form(
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
                      child: const Text('Salvar'),
                      onPressed: () => {
                        salvar(email.text.trim(), name.text.trim(),
                            password.text.trim(), category.text.trim())
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void salvar(email, name, password, category) async {
    var usuariosService = UsuariosService();
    await usuariosService.novo(email, name, password, category);
  }
}
