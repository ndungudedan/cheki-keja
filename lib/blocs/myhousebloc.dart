import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:cheki_keja/models/tenant.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class MyhouseBloc {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  MyhouseBloc();
  final fetcher = BehaviorSubject<Myhouse>();
  Stream<Myhouse> get result => fetcher.stream;

  fetchMyhouse() async {
    MyTenantResponse res = await repo.getMyhouse();
    //fetcher.sink.add(res);
    await insertMyTenant(res);
  }

  dispose() {
    fetcher.close();
  }

  Future<void> insertMyTenant(MyTenantResponse myhouse) async {
    final house_units = <TenantUnitTableCompanion>[];
    final house_payments = <HousePaymentsTableCompanion>[];
    final fixed_bills = <FixedBillsTableCompanion>[];
    final variable_bills = <VariableBillsTableCompanion>[];
    myhouse.houseunits!.forEach((value) {
      var companion = TenantUnitTableCompanion(
        onlineid: Value(value.houseid!.toString()),
        unit_deposit:Value(value.unit_deposit!),
        unit_price:Value(value.unit_price),
        unit_type_name: Value(value.unit_type_name!),
        label: Value(value.label),
        entry_date: Value(value.entry_date),
        building_name: Value(value.building_name),
      );
      house_units.add(companion);
    });
    myhouse.payments!.forEach((value) {
      var companion = HousePaymentsTableCompanion(
        onlineid: Value(value.id!.toString()),
        amount: Value(value.amount!.toString()),
        payment_description: Value(value.payment_description),
        payment_method: Value(value.payment_method),
        payment_reason: Value(value.payment_reason!),
        phone_number: Value(value.phone_number!),
        transaction_date: Value(value.transaction_date),
      );
      house_payments.add(companion);
    });
    myhouse.fixedbills!.forEach((value) {
      var companion = FixedBillsTableCompanion(
        onlineid: Value(value.id!.toString()),
        name:Value(value.name!),
        deposit:Value(value.deposit),
        amount: Value(value.amount!),
        payment_frequency: Value(value.payment_frequency),
        unit: Value(value.unit),
      );
      fixed_bills.add(companion);
    });
    myhouse.variablebills!.forEach((value) {
      var companion = VariableBillsTableCompanion(
        onlineid: Value(value.id!.toString()),
        bill_name: Value(value.bill_name!.toString()),
        amount_per_unit: Value(value.amount_per_unit!),
        payment_status: Value(value.payment_status),
        number_of_units: Value(value.number_of_units),
        read_on: Value(value.read_on!),
      );
      variable_bills.add(companion);
    });
     dao.insertMyTenant(house_units, house_payments, variable_bills,fixed_bills);
  }

}
