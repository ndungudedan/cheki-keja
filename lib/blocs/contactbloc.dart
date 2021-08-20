import 'dart:convert';

import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/contact.dart' as contactModel;
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  ContactBloc();
  final fetcher = BehaviorSubject<contactModel.Contacts>();
  Stream<contactModel.Contacts> get result => fetcher.stream;

  fetchContacts() async {
    var res = await repo.getContacts();
    var map = json.decode(res);
    var result=  contactModel.Contacts.fromJson(map);
    fetcher.sink.add(result);
    await insertContacts(result);
  }

  dispose() {
    fetcher.close();
  }

  Future<void> insertContacts(contactModel.Contacts contacts) async {
    dao.deleteContacts();
    final details = ContactsCompanion(
      onlineid: Value(contacts.id!),
      phone: Value(contacts.phone!),
      address: Value(contacts.address),
      email: Value(contacts.email!),
      location: Value(contacts.location),
      twitter: Value(contacts.twitter),
      facebook: Value(contacts.facebook),
      instagram: Value(contacts.instagram),
    );
    dao.insertContacts(details);
  }
}
