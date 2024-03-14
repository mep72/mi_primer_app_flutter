import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';

import '../data/pendientes_data.dart';

class PendienteProvider extends ChangeNotifier {
  late final PendientesData _pendientesData = PendientesData();
  final List<PendienteModel> _pendientes = [];
  /*
    PendienteModel(id: 1, descripcion: 'Comprar leche', terminado: false),
    PendienteModel(id: 2, descripcion: 'Sacar la basura', terminado: true),
    PendienteModel(id: 3, descripcion: 'Lavar los platos', terminado: false),
  ];*/

  List<PendienteModel> get pendientes => List.from(_pendientes);

  Future<void> cargaPendientes() async {
    _pendientes.clear();
    _pendientes.addAll(await _pendientesData.pendientes());
    notifyListeners();
  }

  void clear() {
    _pendientes.clear();
    notifyListeners();
  }

  void creaPendienteEjemplo() {
    PendienteModel pendiente = PendienteModel(
      id: _pendientes.length + 1,
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
    _pendientesData.insertPendiente(pendiente);
    notifyListeners();
  }

  void eliminar(int index) {
    final pendiente = _pendientes[index];
    _pendientes.removeAt(index);
    _pendientesData.deletePendiente(pendiente);
    notifyListeners();
  }
}
