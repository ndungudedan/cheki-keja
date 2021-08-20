import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:moor/moor.dart';
part 'dao.g.dart';

@UseDao(tables: [
  MyApartmentTable,
  MyHouseDetails,
  MyHousePayments,
  MyHouseArrears,
  Contacts,
  OfflineActivity,
  TransactionsTable,
  BillerTable,
  BuildingUnitTable,
  HousePaymentsTable,
FixedBillsTable,
VariableBillsTable,
TenantUnitTable
])
class DatabaseDao extends DatabaseAccessor<DatabaseHelper>
    with _$DatabaseDaoMixin {
  DatabaseDao(DatabaseHelper db) : super(db);

  void deleteAllPosts() {
    (delete(myApartmentTable)).go();
  }

  void deleteContacts() {
    delete(contacts).go();
  }

  void deleteOfflineActivity() {
    delete(offlineActivity).go();
  }

  void deleteMyHouse() {
    (delete(myHouseDetails)).go();
    (delete(myHouseArrears)).go();
    (delete(myHousePayments)).go();
  }

    Stream<List<BillerTableData>> watchBillers() {
    return (select(billerTable)..where((r) => r.enabled.equals(true))).watch();
  }

  Stream<List<TransactionsTableData>> watchTransactions() {
    return (select(transactionsTable)..orderBy([(u) => OrderingTerm(expression: u.onlineid,mode: OrderingMode.desc)])).watch();
  }

  Stream<List<BillerTableData>> watchBillersCategory(var category) {
    return (select(billerTable)..where((r) => r.enabled.equals(true) & r.biller_category.equals(category))).watch();
  }

// watches all todo entries in a given category. The stream will automatically
  // emit new items whenever the underlying data changes.
  Future<List<MyApartmentTableData>> fetchPosts() {
    return (select(myApartmentTable).get());
  }

  Stream<List<BuildingUnitTableData>> fetchBuildingUnits(var building_id) {
    return (select(buildingUnitTable)..where((r) => r.buildingid.equals(building_id))).watch();
  }

  Stream<List<MyApartmentTableData>> watchPosts() {
    return (select(myApartmentTable)).watch();
  }

  Stream<List<TenantUnitTableData>>? watchTenantUnits() {
    return (select(tenantUnitTable)).watch();
  }
  Stream<List<HousePaymentsTableData>>? watchTenantPayments() {
    return (select(housePaymentsTable)).watch();
  }
  Stream<List<FixedBillsTableData>>? watchFixedBills() {
    return (select(fixedBillsTable)).watch();
  }
  Stream<List<VariableBillsTableData>>? watchVariableBills() {
    return (select(variableBillsTable)).watch();
  }

  Stream<List<MyHouseDetail>> watchMyHouseDetails() {
    return (select(myHouseDetails)).watch();
  }

  Stream<List<MyHouseArrear>> watchMyHouseArrears() {
    return (select(myHouseArrears)).watch();
  }

  Stream<List<MyHousePayment>> watchMyHousePayments() {
    return (select(myHousePayments)).watch();
  }

  Stream<Contact> watchContacts() {
    return (select(contacts)).watchSingle();
  }

  Future<List<OfflineActivityData>> watchOfflineActivity() {
    return (select(offlineActivity)).get();
  }

void insertOfflineActivity(OfflineActivityCompanion values) async {
    await batch((batch) {
      batch.insert(offlineActivity, values);
    }).catchError((Object error) {
      print('errotr');
    });
  }

  void insertContacts(ContactsCompanion values) async {
    await batch((batch) {
      batch.insert(contacts, values);
    }).catchError((Object error) {
      print('errotr');
    });
  }

  void insertPosts(List<MyApartmentTableCompanion> values) async {
    await batch((batch) {
      batch.insertAll(myApartmentTable, values);
    }).catchError((Object error) {
      print('errotr');
    });
  }

  void insertUnits(List<BuildingUnitTableCompanion> values) async {
    await batch((batch) {
      batch.insertAll(buildingUnitTable, values);
    }).catchError((Object error) {
      print('errotr');
    });
  }

  void insertMyHouse(
      MyHouseDetailsCompanion details,
      List<MyHouseArrearsCompanion> arrears,
      List<MyHousePaymentsCompanion> payments) async {
    await batch((batch) {
      batch.insert(myHouseDetails, details);
      batch.insertAll(myHouseArrears, arrears);
      batch.insertAll(myHousePayments, payments);
    }).catchError((Object error) {
      print('errotr');
    });
  }

    void insertMyTenant(
      List<TenantUnitTableCompanion> tenant_units,
      List<HousePaymentsTableCompanion> house_payments,
      List<VariableBillsTableCompanion> variable_bills,
      List<FixedBillsTableCompanion> fixed_bills) async {
    await batch((batch) {
      batch.insertAll(tenantUnitTable, tenant_units);
      batch.insertAll(housePaymentsTable, house_payments);
      batch.insertAll(variableBillsTable, variable_bills);
      batch.insertAll(fixedBillsTable, fixed_bills);
    }).catchError((Object error) {
      print('errotr');
    });
  }

  void insertBillers(List<BillerTableCompanion> values) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(billerTable, values);
    }).catchError((Object error) {
      print(error.toString());
    });
  }

  void insertTransactions(List<TransactionsTableCompanion> values) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(transactionsTable, values);
    }).catchError((Object error) {
      print(error.toString());
    });
  }

  void addPost(MyApartment val) {
    final _entry = MyApartmentTableCompanion(
      onlineid: Value(val.id!.toString()),
      banner: Value(val.banner!),
      bannertag: Value(val.bannertag!),
      ownerid: Value(val.ownerid!.toString()),
      description: Value(val.description),
      title: Value(val.title!),
      emailaddress: Value(val.email),
      location: Value(val.location),
      address: Value(val.address),
      phone: Value(val.phone),
      video: Value(val.video),
      space: Value(val.space!),
      latitude: Value(val.latitude!.toString()),
      longitude: Value(val.longitude!.toString()),
      rating: Value(val.rating!),
      likes: Value(val.likes!.toString()),
      comments: Value(val.comments!.toString()),
      liked: Value(val.liked!),
    );
    into(myApartmentTable).insert(_entry);
  }
}
