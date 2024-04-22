import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Center(
          child: OutlinedButton(
        child: const Text('Iniciar sesión'),
        onPressed: () {
          usuarioProvider.iniciarSesion('usuario', 'password');
        },
      )),
    );
  }
}
