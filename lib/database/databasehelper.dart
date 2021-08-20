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
  OfflineActivity,
  TransactionsTable,
  BillerTable,
  BuildingUnitTable,
  HousePaymentsTable,
FixedBillsTable,
VariableBillsTable,
TenantUnitTable
], daos: [
  DatabaseDao
])
class DatabaseHelper extends _$DatabaseHelper {
  // we tell the database where to store the data with this constructor
  DatabaseHelper() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 3;
}

class MyApartmentTable extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get onlineid => text()();
  TextColumn? get banner => text()();
  TextColumn? get bannertag => text()();
  TextColumn? get ownerid => text()();
  TextColumn? get ownername => text()();
  TextColumn? get ownerlogo => text()();
  TextColumn? get description => text().nullable()();
  TextColumn? get title => text()();
  
  TextColumn? get emailaddress => text().nullable()();
  TextColumn? get location => text().nullable()();
  TextColumn? get address => text().nullable()();
  TextColumn? get phone => text().nullable()();
  TextColumn? get video => text().nullable()();
  
  
  TextColumn? get space => text()();
  TextColumn? get latitude => text()();
  TextColumn? get longitude => text()();
  BoolColumn? get vacant => boolean()();
  TextColumn? get rating => text()();
  TextColumn? get likes => text()();
  TextColumn? get liked => text()();
  TextColumn? get comments => text()();
}

class BuildingUnitTable extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get buildingid => text()();
  TextColumn? get category => text()();
  TextColumn? get deposit => text()();
  TextColumn? get rent => text()();
}

class MyHouseDetails extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get onlineid => text()();
  TextColumn? get ownerid => text()();
  TextColumn? get ownername => text()();
  TextColumn? get ownerlogo => text()();
  TextColumn? get owneraddress => text()();
  TextColumn? get owneremail => text()();
  TextColumn? get ownerlocation => text()();
  TextColumn? get ownerphone => text()();
  TextColumn? get category => text()();
  TextColumn? get unit => text()();
  TextColumn? get deposit => text()();
  TextColumn? get price => text()();
  TextColumn? get title => text()();
  TextColumn? get payed => text()();
  TextColumn? get rating => text()();
}

class MyHouseArrears extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get onlineid => text()();
  TextColumn? get amount => text()();
  TextColumn? get year => text()();
  TextColumn? get month => text()();
}

class MyHousePayments extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get onlineid => text()();
  TextColumn? get transactionid => text()();
  TextColumn? get amount => text()();
  TextColumn? get status => text()();
  TextColumn? get time => text()();
  TextColumn? get year => text()();
  TextColumn? get month => text()();
  TextColumn? get type => text()();
}

class Contacts extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get onlineid => text()();
  TextColumn? get phone => text()();
  TextColumn? get address => text().nullable()();
  TextColumn? get location => text().nullable()();
  TextColumn? get email => text()();
  TextColumn? get twitter => text().nullable()();
  TextColumn? get facebook => text().nullable()();
  TextColumn? get instagram => text().nullable()();
}

class OfflineActivity extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get userId => text()();
  TextColumn? get apartmentId => text().nullable()();
  BoolColumn? get like => boolean().nullable()();
  BoolColumn? get dislike => boolean().nullable()();
  TextColumn? get comment => text().nullable()();
}

class BillerTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get biller_name => text().nullable()();
  TextColumn get biller_category => text().nullable()();
  TextColumn get minimum_balance => text().nullable()();
  TextColumn get secondary_account => text().nullable()();
  TextColumn get biller_code => text().nullable()();
  BoolColumn get enabled => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

class TransactionsTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get amount => text().nullable()();
  TextColumn get token => text().nullable()();
  TextColumn get units => text().nullable()();
  TextColumn get account => text().nullable()();
  TextColumn get biller_code => text().nullable()();
  TextColumn get transaction_id => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get time => text().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

class HousePaymentsTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get phone_number => text().nullable()();
  TextColumn get payment_reason => text().nullable()();
  TextColumn get payment_method => text().nullable()();
  TextColumn get amount => text().nullable()();
  TextColumn get payment_description => text().nullable()();
  TextColumn get transaction_date => text().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

class FixedBillsTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get name => text().nullable()();
  TextColumn get deposit => text().nullable()();
  TextColumn get amount => text().nullable()();
  TextColumn get payment_frequency => text().nullable()();
  TextColumn get unit => text().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

class VariableBillsTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get bill_name => text().nullable()();
  TextColumn get amount_per_unit => text().nullable()();
  TextColumn get number_of_units => text().nullable()();
  TextColumn get payment_status => text().nullable()();
  TextColumn get read_on => text().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

class TenantUnitTable extends Table {
  TextColumn get onlineid => text()();
  TextColumn get unit_price => text().nullable()();
  TextColumn get label => text().nullable()();
  TextColumn get building_name => text().nullable()();
  TextColumn get unit_deposit => text().nullable()();
  TextColumn get entry_date => text().nullable()();
  TextColumn get unit_type_name => text().nullable()();

  @override
  Set<Column> get primaryKey => {onlineid};
}

final databasehelper = DatabaseHelper();
