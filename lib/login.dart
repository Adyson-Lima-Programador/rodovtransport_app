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
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xffffbd59),
    ),
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
        backgroundColor: Color(0xffffbd59),
        foregroundColor: Color(0xff424242),
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
                  cursorColor: Color(0xffffbd59),
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
                  cursorColor: Color(0xffffbd59),
                  controller: password,
                  obscureText: true,
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffffbd59),
                    onPrimary: Color(0xff424242),
                  ),
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
