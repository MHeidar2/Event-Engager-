import 'dart:async';
import 'register.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    
    join(await getDatabasesPath(), 'Userr_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, fullname TEXT, faculty TEXT ,email TEXT, password TEXT)",
      );
    },
    
    version: 1,
  );

  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final Database db = await database;

   
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    // Get a reference to the database.
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        fullname: maps[i]['fullname'],
        faculty: maps[i]['faculty'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    final db = await database;

    await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await database;

    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  var ahmed = User(
    id: 0,
    fullname: 'ahmed',
    faculty: 'cs',
    email: 'ahmed@gmail.com',
    password: 'ahmed123',
  );

  await insertUser(ahmed);

  print(await users());

  ahmed = User(
    id: ahmed.id,
    fullname: ahmed.fullname,
    faculty: ahmed.faculty,
    email: ahmed.email,
    password: ahmed.password,
  );
  await updateUser(ahmed);

  print(await users());

  await deleteUser(ahmed.id);

  print(await users());
}

class User {
  final int id;
  final String fullname;
  final String faculty;
  final String email;
  final String password;

  User({this.id, this.fullname, this.faculty, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'faculty': faculty,
      'email': email,
      'password': password,
    };
  }

  /
  @override
  String toString() {
    return 'User{id: $id, fullname: $fullname, faculty: $faculty , email: $email, passowrd: $password }';
  }
}
