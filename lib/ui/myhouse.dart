import 'package:cheki_keja/blocs/myhousebloc.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class myhouse extends StatefulWidget {
  myhouse({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<myhouse> {
  Constants constants = Constants();
  MyhouseBloc myhouseBloc;
  var totalArrears = 0;
  var userId;

  @override
  void initState() {
    super.initState();
    myhouseBloc = MyhouseBloc();
    userId = sharedPreferences.getUserId();
    myhouseBloc.fetchMyhouse(userId);
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
        body: Center(
          child: StreamBuilder(
            stream: myhouseBloc.result,
            builder: (BuildContext context, AsyncSnapshot<Myhouse> snapshot) {
              if (snapshot.hasData) {
                snapshot.data.details != null
                    ? ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: ListTile(
                                trailing: RatingBarIndicator(
                                  rating: double.parse(
                                      snapshot.data.details.rating),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                leading: Image.network(constants.path +
                                    snapshot.data.details.owner_id +
                                    constants.folder +
                                    snapshot.data.details.owner_logo),
                                title: Text(snapshot.data.details.owner_name +
                                    '\n' +
                                    snapshot.data.details.title +
                                    '\n' +
                                    snapshot.data.details.category),
                                isThreeLine: true,
                                subtitle: Text('rent ' +
                                    snapshot.data.details.price +
                                    '\ndeposit ' +
                                    snapshot.data.details.deposit)),
                          ),
                          snapshot.data.arrearsList.arrears.isNotEmpty
                              ? Container(
                                  color: Colors.redAccent,
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                          child: Text(
                                        'You have not payed rent for the following months:',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Center(child: arreardetails(snapshot.data.arrearsList.arrears)),
                                      Center(
                                          child: Text(
                                        'Total due is: ' +
                                            totalArrears.toString(),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Center(
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
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
                                )
                              : SizedBox(
                                  height: 20,
                                ),
                          ExpansionTile(
                            title: Text('Contact us'),
                            children: <Widget>[
                              ListTile(
                                title: Text('Phone'),
                                leading: Icon(Icons.call),
                                subtitle:
                                    Text(snapshot.data.details.owner_phone),
                              ),
                              ListTile(
                                title: Text('Email'),
                                leading: Icon(Icons.email),
                                subtitle:
                                    Text(snapshot.data.details.owner_email),
                              ),
                              ListTile(
                                title: Text('Address'),
                                leading: Icon(Icons.account_box),
                                subtitle: Text(
                                    snapshot.data.details.owner_address +
                                        '\n' +
                                        snapshot.data.details.owner_location),
                              ),
                            ],
                          ),
                          int.parse(snapshot.data.details.payed) == 0
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
                                ),
                          Center(child: Text('Payment history')),
                          snapshot.data.paymentsList.payments != null
                              ? DataTable(
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
                                  rows: snapshot.data.paymentsList.payments
                                      .map(
                                        (Payments) => DataRow(cells: [
                                          DataCell(
                                            Text(Payments.transaction_id),
                                          ),
                                          DataCell(
                                            Text(Payments.time),
                                          ),
                                          DataCell(
                                            Text(Payments.type),
                                          ),
                                          DataCell(
                                            Text(Payments.amount),
                                          ),
                                        ]),
                                      )
                                      .toList(),
                                )
                              : CircularProgressIndicator(),
                          ConnectionCallback(
                            onlineCall: () {},
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {}
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
  Text arreardetails(var arrearList) {
    var val = '';
    var year = '';
    for (var i = 0; i < arrearList.length; i++) {
      totalArrears = int.parse(arrearList.elementAt(i).amount) + totalArrears;
      val = val + arrearList.elementAt(i).month + ',';
      if (year.isNotEmpty &&
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
}
