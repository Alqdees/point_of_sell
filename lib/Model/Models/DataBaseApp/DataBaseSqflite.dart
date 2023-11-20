import 'dart:io';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseSqflite {
  static const dataBaseName = "Point.db";
  static const version = 1;
  static const TableName = 'Items';
  static const id = 'ID';
  static const name = 'Name';
  static const codeItem = 'Code';
  static const sale = 'Sale';
  static const buy = 'Buy';
  static const quantity = 'Quantity';

  Database? _database;
  var s;
  DataBaseSqflite() {
    databasesq;
    if (Platform.isWindows || Platform.isLinux) {
      s = databaseFactoryFfi;
    }
  }

  Future<Database?> get databasesq async {
    if (_database != null) {
      return _database;
    } else if (Platform.isWindows || Platform.isLinux) {
      return widowsApp();
    } else {
      return await initDataBase();
    }
  }

  static Future<Database> initDataBase() async {
    var datPath = await getDatabasesPath();
    String path = join(datPath, dataBaseName);
    if (!await databaseExists(path)) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      ByteData data = await rootBundle.load(join("assets", dataBaseName));

      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes);
    } else {
      // print("opening data first");
    }
    return await openDatabase(path, version: version);
  }

  Future<Database?> widowsApp() async {
    // print("_____________$path");

    final path = await getDatabasesPath();
    print('_______$path');
    return await s.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: version,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE IF NOT EXISTS $TableName ($id INTEGER PRIMARY KEY AUTOINCREMENT  , $name TEXT , $codeItem TEXT , $sale TEXT , $buy TEXT , $quantity TEXT )");
              
        },
      ),
    );
  }

  Future insert(String table, Map<String, dynamic> data) async {
    Database? db = await databasesq;
    return db!.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
