import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _login();
  }
}

_login() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginHome(),
  );
}

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RodovTransport'),
      ),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  child: const Text('Entrar'),
                  onPressed: () => {
                    if (email.text.trim() == "admin@admin.com" &&
                        password.text.trim() == "123")
                      {
                        manipulaDadosDoForm(email.text, password.text)
                        // Navigator.pushNamed(
                        //   context,
                        //   '/list',
                        // )
                      },
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  bool manipulaDadosDoForm(nome, password) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Nome: ' + nome + '\n' + 'Senha: ' + password),
          );
        });
    debugPrintSynchronously('O nome é: $nome e a senha é: $password');
    return true;
  }
}


