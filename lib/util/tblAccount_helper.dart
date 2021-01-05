import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter/material.dart';
class tblAccount_helper {

  static tblAccount_helper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String tblAccount1 = 'tblAccount';
  String colId = 'id';
  String colsgi = 'sgi';
  String colfirstName = 'firstName';
  String collastName = 'lastName';
  String colemail = 'email';
  String colphone = 'phone';
  String colposition = 'position';

  tblAccount_helper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory tblAccount_helper() {

    if (_databaseHelper == null) {
      _databaseHelper = tblAccount_helper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'campusreturn.db';
    debugPrint('hi $directory');
    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $tblAccount1($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colsgi TEXT, '
        '$colfirstName TEXT, $collastName INTEGER, $colemail TEXT, $colphone TEXT, $colposition TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList(String SGI) async {
    Database db = await this.database;

		var result = await db.rawQuery('SELECT * FROM $tblAccount1');
   // var result = await db.query(tblAccount, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(tblAccount Emp) async {
    Database db = await this.database;
    var result = await db.insert(tblAccount1, Emp.toMap());
    return result;
  }
  // Update Operation: Update a Note object and save it to database


  // Delete Operation: Delete a Note object from database

  // Get number of Note objects in database

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<tblAccount>> getNoteList() async {

    var noteMapList = await getNoteMapList('A9548993');
    debugPrint(noteMapList.length.toString());// Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<tblAccount> noteList = List<tblAccount>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(tblAccount.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}