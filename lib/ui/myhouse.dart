import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/myhousebloc.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';

class MyHouse extends StatefulWidget {
  MyHouse({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHouse> {
  Constants constants = Constants();
  late MyhouseBloc myhouseBloc;
  var dao = DatabaseDao(databasehelper);
  var userId;

  @override
  void initState() {
    super.initState();
    myhouseBloc = MyhouseBloc();
    userId = sharedPreferences.getUserId();
    //myhouseBloc.fetchMyhouse(userId);
  }

  @override
  void dispose() {
    super.dispose();
    myhouseBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Apartment'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ConnectionCallback(
              onlineCall: () {},
            ),
            StreamBuilder<List<MyHouseDetail>>(
              stream: dao.watchMyHouseDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 140,
                        width: MediaQuery.of(context).size.width/1.2,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                                                          child: CachedNetworkImage(
                                                            height: 140,
                                                            width: MediaQuery.of(context).size.width/2.65,
                                imageUrl: constants.path +
                                    snapshot.data![0].ownerid +
                                    constants.folder +
                                    snapshot.data![0].ownerlogo,
                                placeholder: (context, url) => Container(
                                  height: 140,
                                                            width: MediaQuery.of(context).size.width/2.6,
                                    alignment: Alignment(0.0, 2.0),
                                    child: Center(
                                        child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) => Container(
                                  height: 140,
                                                            width: MediaQuery.of(context).size.width/2.6,
                                    alignment: Alignment(0.0, 2.0),
                                    child: Center(child: Icon(Icons.error))),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                                                          child: Container(alignment: Alignment.bottomLeft,
                                                            color: Colors.grey[200],
                                                            height: 120,
                                                            width: MediaQuery.of(context).size.width/2,
                                                            child: ListTile(
                                  title: Text(snapshot.data![0].ownername +
                                      '\n' +
                                      snapshot.data![0].title +
                                      '\n' +
                                      snapshot.data![0].category),
                                  isThreeLine: true,
                                  subtitle: Text('rent: ' +
                                      snapshot.data![0].price +
                                      '\ndeposit: ' +
                                      snapshot.data![0].deposit +
                                      '\nunit: ' +
                                      snapshot.data![0].unit)),
                                                          ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                        child: ExpansionTile(
                          title: Text('Contact us'),
                          children: <Widget>[
                            ListTile(
                              title: Text('Phone'),
                              leading: Icon(Icons.call),
                              subtitle: Text(snapshot.data![0].ownerphone),
                            ),
                            ListTile(
                              title: Text('Email'),
                              leading: Icon(Icons.email),
                              subtitle: Text(snapshot.data![0].owneremail),
                            ),
                            ListTile(
                              title: Text('Address'),
                              leading: Icon(Icons.account_box),
                              subtitle: Text(snapshot.data![0].owneraddress +
                                  '\n' +
                                  snapshot.data![0].ownerlocation),
                            ),
                          ],
                        ),
                      ),
                    int.parse(snapshot.data![0].payed) == 0
                          ? FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              textColor: Colors.white,
                              highlightColor: Colors.deepOrange,
                              color: Colors.deepOrangeAccent,
                              autofocus: true,
                              child: Text('pay rent'),
                              onPressed: () {},
                            )
                          : SizedBox(
                              height: 20,
                            ),],
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
              },
            ),
            StreamBuilder<List<MyHouseArrear>>(
              stream: dao.watchMyHouseArrears(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Container(
                    color: Colors.redAccent,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          'You have not payed rent for the following months:',
                          style: TextStyle(color: Colors.white),
                        )),
                        Center(
                            child: arreardetails(
                                snapshot.data)),
                        Center(
                            child: Text(
                          'Total due is: ' +
                              totalArrears(
                                  snapshot.data),
                          style: TextStyle(color: Colors.white),
                        )),
                        Center(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            textColor: Colors.white,
                            highlightColor: Colors.deepOrange,
                            color: Colors.orange,
                            autofocus: true,
                            child: Text('pay balance'),
                            onPressed: () {},
                          ),
                        ),
                        Center(
                          child: Text(
                            'This sum is not inclusive of this months rent',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('No data'),
                  );
                } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(''),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            StreamBuilder<List<MyHousePayment>>(
              stream: dao.watchMyHousePayments(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      Center(child: Text('Payment history')),
                      DataTable(
                              columnSpacing: 15.0,
                              columns: [
                                DataColumn(
                                  label: Text('Trasaction'),
                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('Date paid'),
                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('Type'),
                                  numeric: false,
                                ),
                                DataColumn(
                                  label: Text('Amount'),
                                  numeric: false,
                                ),
                              ],
                              rows: getRows(snapshot.data),
                            )
                    ],
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
              },
            )
          ],
        ));
  }

  List<DataRow> getRows(var values) {
    List<DataRow> result = [];
    for (var payments in values) {
      var row = DataRow(cells: [
        DataCell(
          Text(payments.transactionid),
        ),
        DataCell(
          Text(payments.time),
        ),
        DataCell(
          Text(payments.type),
        ),
        DataCell(
          Text(payments.amount),
        ),
      ]);
      result.add(row);
    }
    return result;
  }

  Text arreardetails(var arrearList) {
    var val = '';
    String? year = '';
    for (var i = 0; i < arrearList.length; i++) {
      val = val + arrearList.elementAt(i).month + ',';
      if (year!.isNotEmpty &&
          double.parse(arrearList.elementAt(i).year) != double.parse(year)) {
        val = val + ' ' + year + ' and ';
      }
      if (i == arrearList.length - 1) {
        val = val + ' ' + arrearList.elementAt(i).year;
      }
      year = arrearList.elementAt(i).year;
    }
    return Text(
      val,
      style: TextStyle(color: Colors.white),
    );
  }

  String totalArrears(var arrearList) {
    var totalArrears = 0;
    for (var i = 0; i < arrearList.length; i++) {
      totalArrears = int.parse(arrearList.elementAt(i).amount) + totalArrears;
    }
    return totalArrears.toString();
  }
}
