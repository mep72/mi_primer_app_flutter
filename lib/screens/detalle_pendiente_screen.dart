import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';

class DetallePendienteScreen extends StatefulWidget {
  final int index;
  final PendienteModel pendienteModel;
  final Function(BuildContext context, int index, PendienteModel pendiente)
      grabar;
  const DetallePendienteScreen(
      {super.key,
      required this.index,
      required this.grabar,
      required this.pendienteModel});

  @override
  State<DetallePendienteScreen> createState() => _DetallePendienteScreenState();
}

class _DetallePendienteScreenState extends State<DetallePendienteScreen> {
  final TextEditingController _descripcionController = TextEditingController();
  late PendienteModel _pendienteModel;

  @override
  void initState() {
    _pendienteModel = widget.pendienteModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _descripcionController.text = _pendienteModel.descripcion;

    return Scaffold(
      appBar: AppBar(
        title: widget.index == PendienteModel.indiceVacio
            ? const Text('Pendiente nuevo')
            : Text('Detalle del pendiente # ${widget.pendienteModel.id}'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Detalle del pendiente'),
                  leading: Icon(Icons.task),
                ),
                TextField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción del pendiente',
                  ),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Valor capturado: $value');
                    }
                    setState(() {
                      _pendienteModel = _pendienteModel.copyWith(
                        descripcion: value,
                      );
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pendienteModel = _pendienteModel.copyWith(
                        terminado: !_pendienteModel.terminado,
                      );
                    });
                  },
                  child: Row(
                    children: [
                      _pendienteModel.terminado
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank),
                      const Text('Terminado')
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    PendienteModel pendiente;
                    pendiente = _pendienteModel;
                    widget.grabar(context, widget.index, pendiente);
                    Navigator.pop(context);
                  },
                  child: const Text('GRABAR'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
