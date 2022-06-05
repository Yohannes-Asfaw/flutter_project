import 'dart:io';

import 'package:mynotes/local_cache/local_models/company.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'local_models/user.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  static const userTable = "user";
  static const comTable = "Company";


  DBProvider._();
  Future<Database?> get database async {
    if (kIsWeb){

      
      return null;
    }
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'DB1.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
CREATE TABLE $userTable (
id TEXT PRIMARY KEY,
user_name TEXT,
        full_name TEXT,
        password TEXT,
        Address TEXT,
        department TEXT,
        university TEXT,
)''');
        await db.execute('''
CREATE TABLE $comTable (
id TEXT PRIMARY KEY,
 company_name TEXT ,
        Company_website TEXT,
        password TEXT,
        Address  TEXT,
        dedicated_field TEXT,
)''');


      },
    );
  }

  createCompany(LocalCompany localcomp) async {
    await deleteAll();
    
    final db = await database;
    print(db);
    if (db==null){
      print("becaues it is null we can't use web");
    }
    final response = await db!.insert(comTable, localcomp.toJson());
    return response;
  }

  updateCompany(LocalCompany localcomp) async {
    await deleteAll();
    final db = await database;
    final response = await db!.update(comTable, localcomp.toJson(),
        where: "id= '${localcomp.id}'");
    return response;
  }

  deleteCompany() async {
    final db = await database;
    final response1 = await db!.rawDelete('DELETE FROM $comTable');
  }

  createUserProfile(LocalUser userProfile) async {
    print(userProfile);
    final db = await database;
    final response = await db!.insert(
      userTable,
      userProfile.toJson(),
    );
    print(response);
    return response;
  }

  updateCompanyProfile(LocalUser userProfile) async {
    final db = await database;
    final response = await db!.update(userTable, userProfile.toJson(),
        where: "id= '${userProfile.id}'");
    return response;
  }

  deleteUser() async {
    final db = await database;
    final response1 = await db!.rawDelete('DELETE FROM $userTable');
  }

  deleteAll() async {
    final db = await database;
    final response1 = await db!.rawDelete('DELETE FROM $LocalUser');
    final responsee2 = await db.rawDelete('DELETE FROM $LocalCompany');
    return response1;
  }

  Future<LocalUser?> finduserById(String id) async {
    final db = await database;
    final userJson = await db!.query(userTable, where: "id='"+ id + "'");
    print('skjdksjdksjdksj');
    print(userJson);
    if (userJson.isNotEmpty) {
      return LocalUser
      .fromJson(userJson.first);
    } else {
      return null;
    }
  }

  Future<LocalCompany?> findCompanyById(String id) async {
    final db = await database;
     print(db);
    if (db==null){
      print('hello');
    }
    final companyJson = await db!.query(userTable, where: "id='"+ id + "'");
    print(companyJson);
    if (companyJson.isNotEmpty) {
      return LocalCompany.fromJson(companyJson.first);
    } else {
      return null;
    }
  }

 

  
}