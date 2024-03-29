/* import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:cheki_keja/models/home.dart';
import 'package:cheki_keja/models/tenant.dart';
import 'package:cheki_keja/models/transaction.dart';
import 'package:sqflite/sqflite.dart';

class DbOperations {
  final dbHelper = DatabaseHelper.instance;
  static final imagestable = Constants.imagestable;
  static final tagstable = Constants.tagstable;
  static final featurestable = Constants.featurestable;
  static final apartmenttable = Constants.apartmenttable;
  static final paymenthistorytable = Constants.paymenthistorytable;
  static final homesummarytable = Constants.homesummarytable;
  static final transactionstable = Constants.transactionstable;
  static final tenanttable = Constants.tenanttable;

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this a singleton class
  DbOperations._privateConstructor();
  static final DbOperations instance = DbOperations._privateConstructor();

   Future<MyApartment> insertApartment(MyApartment myApartment) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $apartmenttable WHERE online_id = ?",
        [myApartment.id]));
    if (count == 0) {
      await _db.insert("$apartmenttable", myApartment.toMap());
    } else {
      await _db.update(apartmenttable, myApartment.toMap(),
          where: 'id = ?', whereArgs: [myApartment.id]);
    }
    return myApartment;
  }

  Future<List<MyApartment>> fetchApartments() async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db.query("$apartmenttable",
        columns: MyApartment.columns, orderBy: "id DESC");

    List<MyApartment> apartments = new List();
    results.forEach((result) {
      MyApartment apartment = MyApartment.fromMap(result);
      apartments.add(apartment);
    });

    return apartments;
  }

  Future<int> updateBanner(var id, var val) async {
    Database db = await instance.dbHelper.database;
    return await db.rawUpdate(
        'UPDATE $apartmenttable SET banner = ? WHERE online_id = ?', [val, id]);
  }

  //Images
  Future<Images> insertImages(Images images) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $imagestable WHERE online_id = ?", [images.id]));
    if (count == 0) {
      await _db.insert("$imagestable", images.toMap());
    } else {
      await _db.update(imagestable, images.toMap(),
          where: 'id = ?', whereArgs: [images.id]);
    }
    return images;
  }

  Future<Images> fetchImages(var id) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db
        .rawQuery('SELECT * FROM $imagestable WHERE apartment_id = ?', ['$id']);

    Images image;
    results.forEach((result) {
      image = Images.fromMap(result);
    });

    return image;
  }

  Future<String> fetchSingleImage(var col, var id) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $imagestable WHERE apartment_id = ?", ['$id']));
    if (count == 0) {
      return "";
    } else {
      var results = await _db.rawQuery(
          'SELECT $col FROM $imagestable WHERE apartment_id = ?', ['$id']);
      var val = results.first;
      var res = val[col] as String;
      if (res == null || res.isEmpty) {
        return "";
      } else {
        return res;
      }
    }
  }

  Future<int> updateImage(var col, var id, var val) async {
    Database db = await instance.dbHelper.database;
    return await db.rawUpdate(
        'UPDATE $imagestable SET $col = ? WHERE apartment_id = ?', [val, id]);
  }

  //Tags
  Future<Tags> insertTags(Tags tags) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $tagstable WHERE online_id = ?", [tags.id]));
    if (count == 0) {
      await _db.insert("$tagstable", tags.toMap());
    } else {
      await _db.update(tagstable, tags.toMap(),
          where: 'id = ?', whereArgs: [tags.id]);
    }
    return tags;
  }

  Future<Tags> fetchTags(var id) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db
        .rawQuery('SELECT * FROM $tagstable WHERE apartment_id = ?', ['$id']);
    Tags tags;
    results.forEach((result) {
      tags = Tags.fromMap(result);
    });
    return tags;
  }

    Future<int> updateTag(var col, var id, var val) async {
    Database db = await instance.dbHelper.database;
    return await db.rawUpdate(
        'UPDATE $tagstable SET $col = ? WHERE apartment_id = ?', [val, id]);
  }

  //Features
 /*  Future<Features> insertFeatures(Features features) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $featurestable WHERE online_id = ?",
        [features.id]));
    if (count == 0) {
      await _db.insert("$featurestable", features.toMap());
    } else {
      await _db.update(featurestable, features.toMap(),
          where: 'id = ?', whereArgs: [features.id]);
    }
    return features;
  } */

  Future<Features> fetchFeatures(var id) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db.rawQuery(
        'SELECT * FROM $featurestable WHERE apartment_id = ?', ['$id']);
    Features features;
    results.forEach((result) {
      features = Features.fromMap(result);
    });
    return features;
  }

//Home
    Future<MyHome> insertHome(MyHome myhome) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $paymenthistorytable WHERE online_id = ?",
        [myhome.id]));
    if (count == 0) {
      await _db.insert("$paymenthistorytable", myhome.toMap());
    } else {
      await _db.update(paymenthistorytable, myhome.toMap(),
          where: 'id = ?', whereArgs: [myhome.id]);
    }
    return myhome;
  }

  Future<List<MyHome>> fetchAllHome() async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db.query("$paymenthistorytable",
        columns: MyHome.columns, orderBy: "id DESC");
        
    List<MyHome> myhomes = new List();
    results.forEach((result) {
      MyHome myHome = MyHome.fromMap(result);
      myhomes.add(myHome);
    });
    return myhomes;
  }
    Future<List<MyHome>> fetchHome(var month,var year) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db.rawQuery(
        'SELECT * FROM $paymenthistorytable WHERE month = ? && year = ?', ['$month','$year']);
    List<MyHome> myhomes = new List();
    results.forEach((result) {
      MyHome myHome = MyHome.fromMap(result);
      myhomes.add(myHome);
    });
    return myhomes;
  }
//Home Summary
      Future<MyHomeSummary> insertHomeSummary(MyHomeSummary myhomesummary) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $homesummarytable WHERE month = ? && year = ?",
        [myhomesummary.month,myhomesummary.year]));
    if (count == 0) {
      await _db.insert("$homesummarytable", myhomesummary.toMap());
    } else {
      await _db.update(paymenthistorytable, myhomesummary.toMap(),
          where: 'month = ? && year = ?', whereArgs: [myhomesummary.month,myhomesummary.year]);
    }
    return myhomesummary;
  }

  Future<List<MyHomeSummary>> fetchHomeSummary() async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db.query("$homesummarytable",
        columns: MyHomeSummary.columns, orderBy: "id DESC");
    List<MyHomeSummary> myhomes = new List();
    results.forEach((result) {
      MyHomeSummary myHome = MyHomeSummary.fromMap(result);
      myhomes.add(myHome);
    });
    return myhomes;
  }

//Transactions
      Future<MyTransaction> insertTransaction(MyTransaction transaction) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $transactionstable WHERE online_id = ?",
        [transaction.id]));
    if (count == 0) {
      await _db.insert("$transactionstable", transaction.toMap());
    } else {
      await _db.update(transactionstable, transaction.toMap(),
          where: 'id = ?', whereArgs: [transaction.id]);
    }
    return transaction;
  }

  Future<List<MyTransaction>> fetchTransactions(var aId) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db
        .rawQuery('SELECT * FROM $transactionstable WHERE apartment_id = ? ', [aId]);
    List<MyTransaction> myTransactions = new List();
    results.forEach((result) {
      MyTransaction myTrans = MyTransaction.fromMap(result);
      myTransactions.add(myTrans);
    });
    return myTransactions;
  }

//Tenants
      Future<MyTenant> insertTenant(MyTenant tenant) async {
    Database _db = await instance.dbHelper.database;
    var count = Sqflite.firstIntValue(await _db.rawQuery(
        "SELECT COUNT(*) FROM $tenanttable WHERE online_id = ?",
        [tenant.id]));
    if (count == 0) {
      await _db.insert("$tenanttable", tenant.toMap());
    } else {
      await _db.update(tenanttable, tenant.toMap(),
          where: 'id = ?', whereArgs: [tenant.id]);
    }
    return tenant;
  }

  Future<List<MyTenant>> fetchTenants(var id) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db
        .rawQuery('SELECT * FROM $tenanttable WHERE apartment_id = ?', ['$id']);
    List<MyTenant> myTenants = new List();
    results.forEach((result) {
      MyTenant val = MyTenant.fromMap(result);
      myTenants.add(val);
    });
    return myTenants;
  }

    Future<List<MyTransaction>> fetchTenantTransactions(var tId,var aId) async {
    Database _db = await instance.dbHelper.database;
    List<Map> results = await _db
        .rawQuery('SELECT * FROM $transactionstable WHERE apartment_id = ? && user_id= ?', [aId,tId]);
    List<MyTransaction> myTransactions = new List();
    results.forEach((result) {
      MyTransaction myTrans = MyTransaction.fromMap(result);
      myTransactions.add(myTrans);
    });
    return myTransactions;
  }

  /*  Future<MyApartment> updateApartment(MyApartment myApartment) async {
    Database db = await instance.dbHelper.database;
    await db.update(apartmenttable, myApartment.toMap(),
        where: 'id = ?', whereArgs: [myApartment.id]);
    return myApartment;
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.dbHelper.database;
    return await db.query(salestable);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.dbHelper.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $salestable'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.dbHelper.database;
    int id = row[columnId];
    return await db
        .update(salestable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.dbHelper.database;
    return await db.delete(salestable, where: '$columnId = ?', whereArgs: [id]);
  } */
}
 */