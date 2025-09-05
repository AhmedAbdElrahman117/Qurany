import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quran_app/features/azkar/data/azkar_model.dart';
import 'package:sqflite/sqflite.dart';

class AzkarDB {
  Database? database;

  AzkarDB._();

  static AzkarDB databaseCrud = AzkarDB._();

  String dbName = 'Azkar';

  Future<String> getPath() async {
    var database = await getDatabasesPath();
    String path = join(database, '$dbName.db');

    await deleteDatabase(path);

    ByteData data = await rootBundle.load("assets/DB/azkar-db.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
    return path;
  }

  Future<void> getDatabase() async {
    database = await openDatabase(
      await getPath(),
      version: 1,
    );
  }

  Future<List<AzkarModel>> getAzkarByCategory(
      {required String category}) async {
    List<Map> rawAzakr = await database!
        .rawQuery('Select * From $dbName where category= ?', [category]);

    List<AzkarModel> azkar = [];

    for (int i = 0; i < rawAzakr.length; i++) {
      azkar.add(AzkarModel.fromMap(rawAzakr[i]));
    }
    return azkar;
  }

  Future<List<String>> getAzkarCategories() async {
    List<Map> rawCategories =
        await database!.rawQuery('Select * From category');

    List<String> categories = [];

    for (int i = 0; i < rawCategories.length; i++) {
      categories.add(rawCategories[i]['cat_name']);
    }
    return categories;
  }
}
