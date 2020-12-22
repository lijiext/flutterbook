import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "books.db";
  static final _databaseVersion = 1;

  static final table = 'books';
  static final columnId = '_bookId';
  static final columnName = 'bookName';
  static final columnBookImage = 'bookImage';
  static final columnAuthor = 'bookAuthor';
  static final columnTranslater = 'bookTranslater';
  static final columnPress = 'bookPress';
  static final columnPublishDate = 'bookPublishDate';
  static final columnPage = 'bookPage';
  static final columnPrice = 'bookPrice';
  static final columnPackagingStyle = 'bookPackagingStyle';
  static final columnISBN = 'bookISBN';
  static final columnLocation = 'bookLocation';
  static final columnCount = 'bookCount';

  // 单例
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // 单库
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // 懒加载
    _database = await _initDatabase();
    return _database;
  }

  // 打开一个数据库，如果它不存在则创建
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // 在库中创建一个表
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnAuthor TEXT, 
            $columnTranslater TEXT, 
            $columnPress TEXT NOT NULL,
            $columnBookImage TEXT NOT NULL,
            $columnPublishDate TEXT NOT NULL,
            $columnPackagingStyle TEXT,
            $columnPrice TEXT NOT NULL,
            $columnPage INTEGER,
            $columnISBN TEXT NOT NULL,
            $columnLocation TEXT NOT NUll,
            $columnCount INTEGER NOT NULL,
            columnCreateTime  datetime default (datetime('now', 'localtime'))            
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryByName(String name) async {
    //根据图书名称查找相似的图书
    Database db = await instance.database;
    String sql = "SELECT * FROM $table WHERE $columnName LIKE '$name%'";
    print(sql);
    var result = await db.rawQuery(sql);
    print(result.toString());
    return db.rawQuery(sql);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  //删除表中所有数据并重新建立表
  Future<void> dropTable() async {
    Database db = await instance.database;
    await db.execute('''
      DROP TABLE $table
      ''');
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnAuthor TEXT, 
            $columnTranslater TEXT, 
            $columnPress TEXT NOT NULL,
            $columnBookImage TEXT NOT NULL,
            $columnPublishDate TEXT NOT NULL,
            $columnPackagingStyle TEXT,
            $columnPrice TEXT NOT NULL,
            $columnPage INTEGER,
            $columnISBN TEXT NOT NULL,
            $columnLocation TEXT NOT NUll,
            $columnCount INTEGER NOT NULL,
            columnCreateTime  datetime default (datetime('now', 'localtime'))            
          )
          ''');
  }
}
