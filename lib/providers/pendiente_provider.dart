import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';

class PendienteProvider extends ChangeNotifier {
  final List<PendienteModel> _pendientes = [
    PendienteModel(descripcion: 'Comprar leche', terminado: false),
    PendienteModel(descripcion: 'Sacar la basura', terminado: true),
    PendienteModel(descripcion: 'Lavar los platos', terminado: false),
  ];

  List<PendienteModel> get pendientes => List.from(_pendientes);

  void clear() {
    _pendientes.clear();
    notifyListeners();
  }

  void creaPendienteEjemplo() {
    PendienteModel pendiente = PendienteModel(
      descripcion: 'Un nuevo pendiente ${_pendientes.length}',
      terminado: false,
    );
    _pendientes.add(pendiente);
    notifyListeners();
  }

  void actualizaPendiente(int indice, PendienteModel pendiente) {
    _pendientes[indice] = pendiente;
    notifyListeners();
  }

  void agregarPendiente(PendienteModel pendiente) {
    _pendientes.add(pendiente);
    notifyListeners();
  }
}
