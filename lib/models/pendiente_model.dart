class PendienteModel {
  final String descripcion;
  final bool terminado;
  static int indiceVacio = -99;

  PendienteModel({
    required this.descripcion,
    required this.terminado,
  });

  PendienteModel copyWith({String? descripcion, bool? terminado}) {
    return PendienteModel(
      descripcion: descripcion ?? this.descripcion,
      terminado: terminado ?? this.terminado,
    );
  }

  static PendienteModel vacio() {
    return PendienteModel(
      descripcion: '(SIN)',
      terminado: false,
    );
  }
}
