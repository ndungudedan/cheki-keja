import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/myhousebloc.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:flutter/material.dart';

//add call,message and email functions
class Tenant extends StatefulWidget {
  Tenant({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Tenant> {
  var dao = DatabaseDao(databasehelper);
  MyhouseBloc myHouseBloc = MyhouseBloc();

  @override
  void initState() {
    myHouseBloc.fetchMyhouse();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tenant'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.red,
                ),
                onPressed: () {})
          ],
        ),
        body: ListView(
          children: <Widget>[
            
            Padding(padding: EdgeInsets.all(4),
            child: Text('House Units',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),),
            ),
            StreamBuilder<List<TenantUnitTableData>>(
                stream: dao.watchTenantUnits(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15.0,
                        columns: [
                          DataColumn(
                            label: Text('unit'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('category'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('building'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('deposit'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('rent'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('date'),
                            numeric: false,
                          ),
                        ],
                        rows: getRows(snapshot.data),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('No data'),
                    );
                  } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
Padding(padding: EdgeInsets.all(4),
            child: Text('Payments',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),),
            ),
                StreamBuilder<List<HousePaymentsTableData>>(
                stream: dao.watchTenantPayments(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15.0,
                        columns: [
                          DataColumn(
                            label: Text('phone'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('reason'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('mode'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('amount'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('description'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('date'),
                            numeric: false,
                          ),
                        ],
                        rows: getPaymentRows(snapshot.data!),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('No data'),
                    );
                  } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
Padding(padding: EdgeInsets.all(4),
            child: Text('Fixed Bills',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),),
            ),
 StreamBuilder<List<FixedBillsTableData>>(
                stream: dao.watchFixedBills(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15.0,
                        columns: [
                          DataColumn(
                            label: Text('name'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('deposit'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('frequency'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('unit'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('amount'),
                            numeric: false,
                          ),
                        ],
                        rows: getFixedBillRows(snapshot.data!),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('No data'),
                    );
                  } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                Padding(padding: EdgeInsets.all(4),
            child: Text('Variable Bills',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),),
            ),

                 StreamBuilder<List<VariableBillsTableData>>(
                stream: dao.watchVariableBills(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 15.0,
                        columns: [
                          DataColumn(
                            label: Text('name'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('no. of units'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('amount'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('status'),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('read on'),
                            numeric: false,
                          ),
                        ],
                        rows: getVariableBilltRows(snapshot.data!),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('No data'),
                    );
                  } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),


          ],
        ));
  }

  List<DataRow> getRows(var values) {
    var result = <DataRow>[];
    for (var transaction in values) {
      var row = DataRow(cells: [
        DataCell(
          Text(transaction.label),
        ),
        DataCell(
          Text(transaction.unit_type_name),
        ),
        DataCell(
          Text(transaction.building_name),
        ),
        DataCell(
          Text(transaction.unit_deposit),
        ),
        DataCell(
          Text(transaction.unit_price),
        ),
        DataCell(
          Text(transaction.entry_date),
        ),
      ]);
      result.add(row);
    }
    return result;
  }

  List<DataRow> getPaymentRows(List<HousePaymentsTableData> values) {
    var result = <DataRow>[];
    for (var transaction in values) {
      var row = DataRow(cells: [
        DataCell(
          Text(transaction.phone_number ?? ''),
        ),
        DataCell(
          Text(transaction.payment_reason ?? ''),
        ),
        DataCell(
          Text(transaction.payment_method ?? ''),
        ),
        DataCell(
          Text(transaction.amount ?? ''),
        ),
        DataCell(
          Text(transaction.payment_description ?? ''),
        ),
        DataCell(
          Text(transaction.transaction_date ?? ''),
        ),
      ]);
      result.add(row);
    }
    return result;
  }

    List<DataRow> getFixedBillRows(List<FixedBillsTableData> values) {
    var result = <DataRow>[];
    for (var transaction in values) {
      var row = DataRow(cells: [
        DataCell(
          Text(transaction.name ?? ''),
        ),
        DataCell(
          Text(transaction.deposit ?? ''),
        ),
        DataCell(
          Text(transaction.payment_frequency ?? ''),
        ),
        DataCell(
          Text(transaction.unit ?? ''),
        ),
        DataCell(
          Text(transaction.amount ?? ''),
        ),
      ]);
      result.add(row);
    }
    return result;
  }

   List<DataRow> getVariableBilltRows(List<VariableBillsTableData> values) {
    var result = <DataRow>[];
    for (var transaction in values) {
      var row = DataRow(cells: [
        DataCell(
          Text(transaction.bill_name ?? ''),
        ),
        DataCell(
          Text(transaction.number_of_units ?? ''),
        ),
        DataCell(
          Text(transaction.amount_per_unit ?? ''),
        ),
        DataCell(
          Text(transaction.payment_status ?? ''),
        ),
        DataCell(
          Text(transaction.read_on ?? ''),
        ),
      ]);
      result.add(row);
    }
    return result;
  }

  SnackBar snack(String message) {
    return SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 300),
    );
  }
}
