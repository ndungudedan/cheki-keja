import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:moor/moor.dart';
part 'dao.g.dart';

@UseDao(tables: [
  MyApartmentTable,
  MyHouseDetails,
  MyHousePayments,
  MyHouseArrears,
  Contacts
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

  void deleteMyHouse() {
    (delete(myHouseDetails)).go();
    (delete(myHouseArrears)).go();
    (delete(myHousePayments)).go();
  }

// watches all todo entries in a given category. The stream will automatically
  // emit new items whenever the underlying data changes.
  Future<List<MyApartmentTableData>> fetchPosts() {
    return (select(myApartmentTable).get());
  }

  Stream<List<MyApartmentTableData>> watchPosts() {
    return (select(myApartmentTable)).watch();
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

  Stream<List<Contact>> watchContacts() {
    return (select(contacts)).watch();
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

  void addPost(MyApartment val) {
    final _entry = MyApartmentTableCompanion(
      onlineid: Value(val.id),
      banner: Value(val.banner.first.banner),
      bannertag: Value(val.banner.last.tag),
      ownerid: Value(val.ownerid),
      description: Value(val.description),
      title: Value(val.title),
      emailaddress: Value(val.email),
      location: Value(val.location),
      address: Value(val.address),
      phone: Value(val.phone),
      video: Value(val.video),
      price: Value(val.price),
      deposit: Value(val.deposit),
      space: Value(val.space),
      latitude: Value(val.latitude),
      longitude: Value(val.longitude),
      rating: Value(val.rating),
      likes: Value(val.likes),
      comments: Value(val.comments),
      liked: Value(val.liked),
    );
    into(myApartmentTable).insert(_entry);
  }
}
