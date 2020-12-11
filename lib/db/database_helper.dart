
import 'package:flutter_app_new_task/model/countries.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
 static Database database;
 static final DatabaseHelper instance= DatabaseHelper._privateConstructor();
 DatabaseHelper._privateConstructor();

  createDatabase() async {

    if(database==null){
      String databasesPath = await getDatabasesPath();
      String dbPath = join(databasesPath, 'countries.db');

      database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    }
    print("It came here ${database.path}");

    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE CountriesData ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "alpha2Code TEXT,"
        "altSpellings TEXT,"
        "borders TEXT,"
        "alpha3Code TEXT,"
        "callingCodes TEXT,"
        "languages TEXT,"
        "latlng TEXT,"
        "topLevelDomain TEXT,"
        "regionalBlocs TEXT,"
        "timezones TEXT,"
        "area TEXT,"
        "capital TEXT,"
        "cioc TEXT,"
        "demonym TEXT,"
        "flag TEXT,"
        "gini TEXT,"
        "name TEXT,"
        "nativeName TEXT,"
        "numericCode TEXT,"
        "population TEXT,"
        "region TEXT,"
        "subregion TEXT,"
        "translations TEXT"
        ")");
//database.delete("ReposData");
  }
  Future<int> createCustomer(CountriesData customer) async {
    var result = await database.insert("CountriesData", customer.toJson());
    print("createCustomer  ${result.toString()}");
    return result;
  }

  Future<List> getCustomers() async {
    var result = await database.query("CountriesData", columns: [
      'id',
      'alpha2Code',
      'alpha3Code',
      'area',
      'capital',
      'cioc',
      'demonym',
      'flag',
      'gini',
      'name',
      'nativeName',
      'numericCode',
      'population',
      'region',
      'subregion',
      'translations',]);
    print("getCustomer  ${result.toList()}");
    return result.toList();
  }

  Future<List> getsCustomers() async {
    var result = await database.rawQuery('SELECT * FROM CountriesData');
    return result.toList();
  }

}