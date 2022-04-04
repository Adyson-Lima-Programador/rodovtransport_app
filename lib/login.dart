import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rodovtransport_app/model/servico_autenticacao/autenticacao_service.dart';
import 'package:rodovtransport_app/routes.dart';
import 'package:rodovtransport_app/view/pacotes_cliente_list.dart';

void main() => runApp(const Login());

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
      primaryColor: const Color(0xffffbd59),
    ),
    initialRoute: Routes.root,
    routes: {
      Routes.root: (context) => const LoginHome(),
      Routes.pacotes_cliente: (context) => const PacotesCliente(),
      // Routes.pacotes_empresa: (context) => const PacotesEmpresa(),

    },
    // home: const LoginHome(),
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
                    primary: const Color(0xffffbd59),
                    onPrimary: const Color(0xff424242),
                  ),
                  child: const Text('Entrar'),
                  onPressed: () =>
                      {logar(email.text.trim(), password.text.trim())},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void logar(email, password) async {

    var autenticacaoService = AutenticacaoService();
    await autenticacaoService.loginJWT(email, password);

    if (autenticacaoService.categoria == '1') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Bem vindo administrador!'),
            );
          });
    }
    if (autenticacaoService.categoria == '2') {
      Navigator.pushNamed(context,'/pacotes_cliente');
    }
  }
}
