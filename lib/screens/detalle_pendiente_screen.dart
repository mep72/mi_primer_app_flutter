import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';
import 'package:mi_primer_aplicacion/providers/pendiente_provider.dart';
import 'package:provider/provider.dart';

class DetallePendienteScreen extends StatefulWidget {
  final int index;
  final Function(BuildContext context, int index, PendienteModel pendiente)
      grabar;
  const DetallePendienteScreen(
      {super.key, required this.index, required this.grabar});

  @override
  State<DetallePendienteScreen> createState() => _DetallePendienteScreenState();
}

class _DetallePendienteScreenState extends State<DetallePendienteScreen> {
  bool _terminado = false;
  final TextEditingController _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pendienteProvider =
        Provider.of<PendienteProvider>(context, listen: false);
    PendienteModel pendienteEditado = widget.index >= 0
        ? pendienteProvider.pendientes[widget.index]
        : PendienteModel(descripcion: '', terminado: false);

    _descripcionController.text = pendienteEditado.descripcion;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del pendiente'),
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
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _terminado = !_terminado;
                    });
                  },
                  child: Row(
                    children: [
                      _terminado
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank),
                      const Text('Terminado')
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    PendienteModel pendiente;
                    pendiente = PendienteModel(
                      descripcion: _descripcionController.text,
                      terminado: _terminado,
                    );
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
