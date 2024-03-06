class PendienteModel {
  final int id;
  final String descripcion;
  final bool terminado;
  static int indiceVacio = -99;

  PendienteModel({
    required this.id,
    required this.descripcion,
    required this.terminado,
  });

  PendienteModel copyWith({int? id, String? descripcion, bool? terminado}) {
    return PendienteModel(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      terminado: terminado ?? this.terminado,
    );
  }

  static PendienteModel vacio() {
    return PendienteModel(
      id: indiceVacio,
      descripcion: '(SIN)',
      terminado: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'terminado': terminado ? 1 : 0,
    };
  }
}
