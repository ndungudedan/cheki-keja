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

@UseMoor(tables: [MyApartmentTable], daos: [DatabaseDao])
class DatabaseHelper extends _$DatabaseHelper {
  // we tell the database where to store the data with this constructor
  DatabaseHelper() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}

class MyApartmentTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get onlineid => text()();
  TextColumn get banner => text()();
  TextColumn get bannertag => text()();
  TextColumn get ownerid => text()();
  TextColumn get description => text().nullable()();
  TextColumn get title => text()();
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
  TextColumn get rating => text()();
  TextColumn get likes => text()();
  TextColumn get liked => text()();
  TextColumn get comments => text()();
}

final databasehelper = DatabaseHelper();
