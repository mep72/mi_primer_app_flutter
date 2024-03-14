import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mi_primer_aplicacion/models/pendiente_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PendientesData {
  Database? _database;

  PendientesData() {
    _preparaDatabase().then((value) {
      if (kDebugMode) {
        print('Base de datos inicializada');
      }
    });
  }

  Future<void> _preparaDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'pendientes.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE pendiente(id INTEGER PRIMARY KEY AUTOINCREMENT, descripcion TEXT, terminado INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    _database = await database;
  }

  Future<void> insertPendiente(PendienteModel pendiente) async {
    await _preparaDatabase();
    final db = await _database;

    await db!.insert(
      'pendiente',
      pendiente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePendiente(PendienteModel pendiente) async {
    await _preparaDatabase();
    final db = await _database;

    await db!.delete(
      'pendiente',
      where: 'id = ?',
      whereArgs: [pendiente.id],
    );
  }

  Future<List<PendienteModel>> pendientes() async {
    await _preparaDatabase();
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db!.query('pendiente');

    return List.generate(maps.length, (i) {
      return PendienteModel(
        id: maps[i]['id'],
        descripcion: maps[i]['descripcion'],
        terminado: maps[i]['terminado'] == 1,
      );
    });
  }
}
