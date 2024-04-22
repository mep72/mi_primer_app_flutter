import 'package:flutter/foundation.dart';
import 'package:mi_primer_aplicacion/models/usuario_model.dart';

class UsuarioProvider extends ChangeNotifier {
  UsuarioModel? _usuario;
  bool get sesionIniciada => _usuario != null;

  void iniciarSesion(String usuario, String password) {
    _usuario = UsuarioModel(
      usuario: usuario,
      password: password,
      nombre: 'Usuario',
    );
    notifyListeners();
  }

  void cerrarSesion() {
    _usuario = null;
    notifyListeners();
  }
}
