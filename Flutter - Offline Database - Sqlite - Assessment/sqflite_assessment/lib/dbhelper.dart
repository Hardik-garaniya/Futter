import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'studentmodel.dart';
import 'usermodel.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database?> getDatabase() async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  static Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'student_management.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name TEXT,
          last_name TEXT,
          email TEXT,
          course TEXT,
          address TEXT,
          pincode TEXT,
          city TEXT,
          total_fees REAL,
          contact_number TEXT,
          marks REAL
        )
      ''');

      db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT,
          role TEXT
        )
      ''');
    });
  }


  static Future<int> insertStudent(Student student) async {
    final db = await getDatabase();
    return await db!.insert('students', student.toMap());
  }

  static Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await getDatabase();
    return await db!.query('students');
  }

  static Future<Map<String, dynamic>?> getStudent(int id) async {
    final db = await getDatabase();
    var result = await db!.query('students', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  static Future<int> updateStudent(Student student, int id) async {
    final db = await getDatabase();
    return await db!.update('students', student.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteStudent(int id) async {
    final db = await getDatabase();
    return await db!.delete('students', where: 'id = ?', whereArgs: [id]);
  }


  static Future<int> insertUser(User user) async {
    final db = await getDatabase();
    return await db!.insert('users', user.toMap());
  }

  static Future<User?> loginUser(String username, String password) async {
    final db = await getDatabase();
    var result = await db!.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }


  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await getDatabase();
    return await db!.query('users');
  }

  static Future<Map<String, dynamic>?> getUser(int id) async {
    final db = await getDatabase();
    var result = await db!.query('users', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  static Future<int> updateUser(User user, int id) async {
    final db = await getDatabase();
    return await db!.update('users', user.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteUser(int id) async {
    final db = await getDatabase();
    return await db!.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
