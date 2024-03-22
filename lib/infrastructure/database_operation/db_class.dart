import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/contact/contact_db_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "contacts.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Contact(id INTEGER PRIMARY KEY, name TEXT, group TEXT, number TEXT, mail TEXT, photo TEXT)");
  }

  Future<int> saveContact(Contact contact) async {
    var dbClient = await db;
    int res = await dbClient.insert("Contact", contact.toMap());
    return res;
  }

  Future<List<Contact>> getContacts() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM Contact');
    List<Contact> contacts = [];
    for (int i = 0; i < list.length; i++) {
      contacts.add(Contact.fromMap(list[i]));
    }
    return contacts;
  }

  Future<int> deleteContact(int id) async {
    var dbClient = await db;
    return await dbClient.delete("Contact", where: "id = ?", whereArgs: [id]);
  }
}
