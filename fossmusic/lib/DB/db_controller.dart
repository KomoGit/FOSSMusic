import 'dart:io';
import 'package:fossmusic/DB/models/model_song.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;
  Future<Database> get _database async => _db ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "FInternalDB.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db,int version)async{
    await db.execute('CREATE TABLE songs (id INTEGER PRIMARY KEY, link TEXT)');
  }

  Future<List<Song>> getSongs()async{
    Database db = await instance._database;
    var songs = await db.query('songs',orderBy: 'id');
    List<Song> songList = songs.isNotEmpty
      ? songs.map((e) => Song.fromMap(e)).toList() : [];
    return songList;
  }
}