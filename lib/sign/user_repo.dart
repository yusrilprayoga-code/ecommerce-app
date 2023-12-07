import 'package:ecommerce_app/sign/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addUser(User user) async {
    final db = await _databaseHelper.database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> getUserByUsername(String username) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      return User(
        id: maps[0]['id'],
        username: maps[0]['username'],
        password: maps[0]['password'],
      );
    } else {
      return null;
    }
  }
}
