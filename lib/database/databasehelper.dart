import 'dart:io';
import 'package:cheki_keja/database/dao.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'databasehelper.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  MyApartmentTable,
  MyHouseDetails,
  MyHouseArrears,
  MyHousePayments,
  Contacts,
  OfflineActivity
], daos: [
  DatabaseDao
])
class DatabaseHelper extends _$DatabaseHelper {
  // we tell the database where to store the data with this constructor
  DatabaseHelper() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 2;
}

class MyApartmentTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get banner => text()();
  TextColumn get bannertag => text()();
  TextColumn get ownerid => text()();
  TextColumn get ownername => text()();
  TextColumn get ownerlogo => text()();
  TextColumn get description => text().nullable()();
  TextColumn get title => text()();
  TextColumn get category => text()();
  TextColumn get emailaddress => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get video => text().nullable()();
  TextColumn get price => text()();
  TextColumn get deposit => text()();
  TextColumn get space => text()();
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  BoolColumn get vacant => boolean()();
  TextColumn get rating => text()();
  TextColumn get likes => text()();
  TextColumn get liked => text()();
  TextColumn get comments => text()();
}

class MyHouseDetails extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get ownerid => text()();
  TextColumn get ownername => text()();
  TextColumn get ownerlogo => text()();
  TextColumn get owneraddress => text()();
  TextColumn get owneremail => text()();
  TextColumn get ownerlocation => text()();
  TextColumn get ownerphone => text()();
  TextColumn get category => text()();
  TextColumn get unit => text()();
  TextColumn get deposit => text()();
  TextColumn get price => text()();
  TextColumn get title => text()();
  TextColumn get payed => text()();
  TextColumn get rating => text()();
}

class MyHouseArrears extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get amount => text()();
  TextColumn get year => text()();
  TextColumn get month => text()();
}

class MyHousePayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get transactionid => text()();
  TextColumn get amount => text()();
  TextColumn get status => text()();
  TextColumn get time => text()();
  TextColumn get year => text()();
  TextColumn get month => text()();
  TextColumn get type => text()();
}

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get phone => text()();
  TextColumn get address => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get email => text()();
  TextColumn get twitter => text().nullable()();
  TextColumn get facebook => text().nullable()();
  TextColumn get instagram => text().nullable()();
}

class OfflineActivity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get apartmentId => text().nullable()();
  BoolColumn get like => boolean().nullable()();
  BoolColumn get dislike => boolean().nullable()();
  TextColumn get comment => text().nullable()();
}

final databasehelper = DatabaseHelper();
