import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final dbLocation = join(dbPath, path);

    return await openDatabase(dbLocation, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute(''' 
    CREATE TABLE notes (
      id $idType,
      title $textType,
      content $textType
    )
    ''');
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await instance.database;
    return await db.insert('notes', note);
  }

  Future<List<Map<String, dynamic>>> fetchNotes() async {
    final db = await instance.database;
    return await db.query('notes');
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateNote(Map<String, dynamic> note) async {
    final db = await instance.database;
    return await db.update('notes', note, where: 'id = ?', whereArgs: [note['id']]);
  }
}

class Task {
  final int? id;
  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}

class DBHelper {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
    );

    return _database!;
  }

  static Future<int> insertTask(Task task) async {
    final db = await getDatabase();
    return await db.insert('tasks', task.toMap());
  }

  static Future<List<Task>> getTasks() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  static Future<int> updateTask(Task task) async {
    final db = await getDatabase();
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<int> deleteTask(int id) async {
    final db = await getDatabase();
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
