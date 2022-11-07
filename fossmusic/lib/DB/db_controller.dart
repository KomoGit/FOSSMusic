import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  //static final _dbName = 'FInternalDB.db';
  //static final _dbVersion = 1;
  static Database? _db;

  DatabaseHelper._privateConstr();
  static final DatabaseHelper instance = DatabaseHelper._privateConstr(); //SINGLETON Pattern
  
  Future<Database> get database async{
    if(_db!=null){
      return _db;
    }
    
  }

}
