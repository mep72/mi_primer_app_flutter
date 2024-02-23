import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';
import 'package:mi_primer_aplicacion/providers/pendiente_provider.dart';
import 'package:mi_primer_aplicacion/screens/detalle_pendiente_screen.dart';
import 'package:mi_primer_aplicacion/widgets/main_bottom_navigation_bar.dart';
import 'package:mi_primer_aplicacion/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PendienteProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final pendienteProvider = Provider.of<PendienteProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          'Mi primer app',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: const MainBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetallePendienteScreen(
                index: -1,
                grabar: grabarPendiente,
              ),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: pendienteProvider.pendientes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              var pendienteEditado =
                  pendienteProvider.pendientes[index].copyWith(
                terminado: !pendienteProvider.pendientes[index].terminado,
              );
              pendienteProvider.actualizaPendiente(index, pendienteEditado);
            },
            child: Card(
              child: ListTile(
                leading: pendienteProvider.pendientes[index].terminado
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                title: Text(pendienteProvider.pendientes[index].descripcion),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallePendienteScreen(
                            index: index,
                            grabar: grabarPendiente,
                          ),
                        ));
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void grabarPendiente(
      BuildContext context, int index, PendienteModel pendiente) {
    final pendienteProvider = Provider.of<PendienteProvider>(
      context,
      listen: false,
    );
    if (index == -1) {
      // crear un pendiente
      pendienteProvider.agregarPendiente(pendiente);
    } else {
      pendienteProvider.actualizaPendiente(index, pendiente);
    }
  }
}