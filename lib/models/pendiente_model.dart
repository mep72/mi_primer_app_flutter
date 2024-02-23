class PendienteModel {
  final String descripcion;
  final bool terminado;

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
}
