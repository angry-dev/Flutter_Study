import 'package:eyebody/data/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final _databaseName = "eyebody.db";
  static final int _databaseVersion = 1;
  static final foodTable = "food";
  static final workOutTable = "workout";
  static final eyeBodyTable = "eyebody";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE IF NOT EXIST $foodTable (
      id INTEGER PROMARY KEY AUTOINCREMENT,
      date INTEGER DEFAULT 0,
      type INTEGER DEFAULT 0,
      kcal INTEGER DEFAULT 0,
      image String,
      memo String,
    )
    """);
    await db.execute("""
    CREATE TABLE IF NOT EXIST $workOutTable (
      id INTEGER PROMARY KEY AUTOINCREMENT,
      date INTEGER DEFAULT 0,
      time INTEGER DEFAULT 0,
      name String,
      image String,
      memo String,
    )
    """);
    await db.execute("""
    CREATE TABLE IF NOT EXIST $eyeBodyTable (
      id INTEGER PROMARY KEY AUTOINCREMENT,
      date INTEGER DEFAULT 0,
      weight INTEGER DEFAULT 0, 
      image String,
    )
    """);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {

  }

  Future<int> insertFood(Food food) async {
    Database db = await instance.database;

    if(food.id == null) {
      final map = food.toMap();
      return await db.insert(foodTable, map);
    } else {
      final map = food.toMap();
      return await db.update(foodTable, map);
    }
  }

  Future<List<Food>> queryFoodByDate(int date) async {
    Database db = await instance.database;
    List<Food> foods = [];

    final query = await db.query(foodTable, where: "date = ?", whereArgs: [date]);

    for(final r in query) {
      foods.add(Food.fromDB(r));
    }

    return foods;
  }

  Future<List<Food>> allFood() async {
    Database db = await instance.database;
    List<Food> foods = [];

    final query = await db.query(foodTable);

    for(final r in query) {
      foods.add(Food.fromDB(r));
    }

    return foods;
  }

  Future<int> insertWorkOut(WorkOut workOut) async {
    Database db = await instance.database;

    if(workOut.id == null) {
      final map = workOut.toMap();
      return await db.insert(workOutTable, map);
    } else {
      final map = workOut.toMap();
      return await db.update(workOutTable, map);
    }
  }

  Future<List<WorkOut>> queryWorkOutByDate(int date) async {
    Database db = await instance.database;
    List<WorkOut> workOuts = [];

    final query = await db.query(workOutTable, where: "date = ?", whereArgs: [date]);

    for(final r in query) {
      workOuts.add(WorkOut.fromDB(r));
    }

    return workOuts;
  }

  Future<List<WorkOut>> allWorkOut() async {
    Database db = await instance.database;
    List<WorkOut> workOuts = [];

    final query = await db.query(workOutTable);

    for(final r in query) {
      workOuts.add(WorkOut.fromDB(r));
    }

    return workOuts;
  }

  Future<int> insertBody(EyeBody eyeBody) async {
    Database db = await instance.database;

    if(eyeBody.id == null) {
      final map = eyeBody.toMap();
      return await db.insert(eyeBodyTable, map);
    } else {
      final map = eyeBody.toMap();
      return await db.update(eyeBodyTable, map);
    }
  }

  Future<List<EyeBody>> queryBodyByDate(int date) async {
    Database db = await instance.database;
    List<EyeBody> eyeBodys = [];

    final query = await db.query(eyeBodyTable, where: "date = ?", whereArgs: [date]);

    for(final r in query) {
      eyeBodys.add(EyeBody.fromDB(r));
    }

    return eyeBodys;
  }

  Future<List<EyeBody>> allBody() async {
    Database db = await instance.database;
    List<EyeBody> eyeBodys = [];

    final query = await db.query(eyeBodyTable);

    for(final r in query) {
      eyeBodys.add(EyeBody.fromDB(r));
    }

    return eyeBodys;
  }
}