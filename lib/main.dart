import 'package:flutter/material.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';
import 'package:mi_primer_aplicacion/providers/pendiente_provider.dart';
import 'package:mi_primer_aplicacion/providers/usuario_provider.dart';
import 'package:mi_primer_aplicacion/screens/detalle_pendiente_screen.dart';
import 'package:mi_primer_aplicacion/screens/login_screen.dart';
import 'package:mi_primer_aplicacion/widgets/main_bottom_navigation_bar.dart';
import 'package:mi_primer_aplicacion/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PendienteProvider()),
      ChangeNotifierProvider(create: (context) => UsuarioProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: usuarioProvider.sesionIniciada
          ? const PaginaPrincipal()
          : const LoginScreen(),
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
              pendienteProvider.cargaPendientes();
            },
            icon: const Icon(Icons.refresh),
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
                index: PendienteModel.indiceVacio,
                grabar: grabarPendiente,
                pendienteModel: PendienteModel(
                  id: PendienteModel.indiceVacio,
                  descripcion: '',
                  terminado: false,
                ),
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
          final pendiente = pendienteProvider.pendientes[index];
          return Dismissible(
            key: Key(pendiente.descripcion),
            onDismissed: (direction) {
              pendienteProvider.eliminar(index);
            },
            child: GestureDetector(
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
                              pendienteModel:
                                  pendienteProvider.pendientes[index],
                            ),
                          ));
                    },
                    icon: const Icon(Icons.edit),
                  ),
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
    if (index == PendienteModel.indiceVacio) {
      // crear un pendiente
      pendienteProvider.agregarPendiente(pendiente);
    } else {
      pendienteProvider.actualizaPendiente(index, pendiente);
    }
  }
}
