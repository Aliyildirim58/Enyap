import 'package:loginpage/model/profiles.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  // ignore: unused_field
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    // ignore: non_constant_identifier_names
    String DbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(DbPath, version: 1, onCreate: CreateDb);
    return eTradeDb;
  }

  // ignore: non_constant_identifier_names
  void CreateDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE profiles(id integer primary key, name text, surname text, nickname VarChar(15), phone VarChar(11), password VarChar(20))");
  }

  Future<List<Profiles>> getProfiles() async {
    Database db = await this.db;
    var result = await db.query("profiles");
    return List.generate(result.length, (i) {
      return Profiles.fromObject(result[i]);
    });
  }

  Future<int> insert(Profiles profiles) async {
    Database db = await this.db;
    var result = await db.insert("profiles", profiles.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from profiles where id= $id");
    return result;
  }

  Future<int> update(Profiles profiles) async {
    Database db = await this.db;
    var result = await db.update("profiles", profiles.toMap(),
        where: "id=?", whereArgs: [profiles.id]);
    return result;
  }
}
