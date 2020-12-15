import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:sqflite/sqlite_api.dart';
import 'BaseDbProvider.dart';

class PersonDbProvider extends BaseDbProvider {
  ///表名
  final String name = 'PresonInfo';

  final String columnId = "id";
  final String columnMobile = "mobile";
  final String columnHeadImage = "headImage";

  PersonDbProvider();

  @override
  tableName() {
    return name;
  }

  @override
  createTableString() {
    return '''
        create table $name (
        $columnId integer primary key,$columnHeadImage text not null,
        $columnMobile text not null)
      ''';
  }

  ///查询数据库
  Future _getPersonProvider(Database db, int id) async {
    List<Map<String, dynamic>> maps =
        await db.rawQuery("select * from $name where $columnId = $id");
    return maps;
  }

  ///插入到数据库
  Future insert(UserModel model) async {
    Database db = await getDataBase();
    var userProvider = await _getPersonProvider(db, model.id);
    if (userProvider != null) {
      ///删除数据
      await db.delete(name, where: "$columnId = ?", whereArgs: [model.id]);
    }
    return await db.rawInsert(
        "insert into $name ($columnId,$columnMobile,$columnHeadImage) values (?,?,?)",
        [model.id, model.mobile, model.headImage]);
  }

  ///更新数据库
  Future<void> update(UserModel model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $name set $columnMobile = ?,$columnHeadImage = ? where $columnId= ?",
        [model.mobile, model.headImage, model.id]);
  }

  Future<List> queryMobile(int id) async {
    Database database = await getDataBase();
    var result = await database.query(name);
    List<UserModel> res = [];
    result.forEach((item) => res.add(UserModel.fromSQL(item)));
    return res;
  }

  ///获取事件数据
  Future<UserModel> getPersonInfo(int id) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await _getPersonProvider(db, id);
    if (maps.length > 0) {
      return UserModel.fromJson(maps[0]);
    }
    return null;
  }
}
