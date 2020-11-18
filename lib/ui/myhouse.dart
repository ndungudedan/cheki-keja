import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myhouse extends StatefulWidget {
  myhouse({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<myhouse> {
  final String path = 'http://www.thebuktu.com/chekiKeja/uploads/';
  //final String path = 'http://192.168.43.247/chekiKeja/uploads/';
  final String folder = '/images/';
  Myhouse myhouse = Myhouse();
  List<Payments> tableList = List<Payments>();
  List<Arrears> arrearList = List<Arrears>();
  Details details = Details();
  PaymentsList payments = PaymentsList();
  ArrearsList arrears = ArrearsList();
  SharedPreferences prefs;
  var totalArrears = 0;
  var userId;

  @override
  void initState() {
    super.initState();
    getPrefs();
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
      body: myhouse.details != null
          ? ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: ListTile(
                      trailing: RatingBarIndicator(
                        rating: double.parse(details.rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      leading: Image.network(path +
                          details.owner_id +
                          folder +
                          details.owner_logo),
                      title: Text(details.owner_name +
                          '\n' +
                          details.title +
                          '\n' +
                          details.category),
                      isThreeLine: true,
                      subtitle: Text('rent ' +
                          details.price +
                          '\ndeposit ' +
                          details.deposit)),
                ),
                arrearList.isNotEmpty
                    ? Container(
                        color: Colors.redAccent,
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text(
                              'You have not payed rent for the following months:',
                              style: TextStyle(color: Colors.white),
                            )),
                            Center(child: arreardetails()),
                            Center(
                                child: Text(
                              'Total due is: ' + totalArrears.toString(),
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
                      subtitle: Text(details.owner_phone),
                    ),
                    ListTile(
                      title: Text('Email'),
                      leading: Icon(Icons.email),
                      subtitle: Text(details.owner_email),
                    ),
                    ListTile(
                      title: Text('Address'),
                      leading: Icon(Icons.account_box),
                      subtitle: Text(details.owner_address +
                          '\n' +
                          details.owner_location),
                    ),
                  ],
                ),
                
                int.parse(details.payed) == 0
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
                tableList != null
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
                        rows: tableList
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
                      onlineCall: () {
                        
                      },
                    ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('issignedin')) {
      setState(() {
        fetchMyhouse();
        userId = prefs.getString('userId');
      });
    }
  }

  Future<void> fetchMyhouse() async {
    var result = await NetworkApi().getMyhouse(userId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      myhouse = Myhouse.fromJson(Map);
      details = myhouse.details;
      payments = myhouse.paymentsList;
      for (int i = 0; i < payments.payments.length; i++) {
        tableList.add(payments.payments.elementAt(i));
      }
      fetchArrears();
    });
  }

  Future<void> fetchArrears() async {
    var result = await NetworkApi().getArrears(userId, details.id);
    print(result);
    var Map = json.decode(result);
    setState(() {
      arrears = ArrearsList.fromJson(Map);
      for (var i = 0; i < arrears.arrears.length; i++) {
        arrearList.add(arrears.arrears.elementAt(i));
      }
    });
  }

  Text arreardetails() {
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
