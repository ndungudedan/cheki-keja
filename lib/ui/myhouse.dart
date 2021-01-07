import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/myhousebloc.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyHouse extends StatefulWidget {
  MyHouse({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHouse> {
  Constants constants = Constants();
  MyhouseBloc myhouseBloc;
  var dao = DatabaseDao(databasehelper);
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
        body: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ConnectionCallback(
                          onlineCall: () {},
                        ),
                        StreamBuilder(
                              stream: dao.watchMyHouseDetails(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView(
                                    children: [
                                      Container(
                          color: Colors.white,
                          child: ListTile(
                              trailing: RatingBarIndicator(
                                rating:
                                    double.parse(snapshot.data.details.rating),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: constants.path +
                                      snapshot.data.details.ownerid +
                                      constants.folder +
                                      snapshot.data.details.ownerlogo,
                                  placeholder: (context, url) => Container(
                                      alignment: Alignment(0.0, 2.0),
                                      child: Center(
                                          child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                          alignment: Alignment(0.0, 2.0),
                                          child:
                                              Center(child: Icon(Icons.error))),
                                ),
                              ),
                              title: Text(snapshot.data.details.ownername +
                                  '\n' +
                                  snapshot.data.details.title +
                                  '\n' +
                                  snapshot.data.details.category),
                              isThreeLine: true,
                              subtitle: Text('rent: ' +
                                  snapshot.data.details.price +
                                  '\ndeposit: ' +
                                  snapshot.data.details.deposit +
                                  '\nunit: ' +
                                  snapshot.data.details.unit)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
                          child: ExpansionTile(
                            title: Text('Contact us'),
                            children: <Widget>[
                              ListTile(
                                title: Text('Phone'),
                                leading: Icon(Icons.call),
                                subtitle:
                                    Text(snapshot.data.details.ownerphone),
                              ),
                              ListTile(
                                title: Text('Email'),
                                leading: Icon(Icons.email),
                                subtitle:
                                    Text(snapshot.data.details.owneremail),
                              ),
                              ListTile(
                                title: Text('Address'),
                                leading: Icon(Icons.account_box),
                                subtitle: Text(
                                    snapshot.data.details.owneraddress +
                                        '\n' +
                                        snapshot.data.details.ownerlocation),
                              ),
                            ],
                          ),
                        ),
                                    ],
                                                                    );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                        StreamBuilder(
                              stream: dao.watchMyHouseArrears(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView(
                                    children: [
                                      Container(
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
                                            snapshot.data.arrearsList.arrears)),
                                    Center(
                                        child: Text(
                                      'Total due is: ' +
                                          totalArrears(snapshot
                                              .data.arrearsList.arrears),
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
                                    ],
                                                                    );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                        
                        StreamBuilder(
                              stream: dao.watchMyHousePayments(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView(
                                    children: [
                                      
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
                                          Text(Payments.transactionid),
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
                                    ],
                                   );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
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
                    )
            );
  }

  Text arreardetails(var arrearList) {
    var val = '';
    var year = '';
    for (var i = 0; i < arrearList.length; i++) {
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

  String totalArrears(var arrearList) {
    var totalArrears = 0;
    for (var i = 0; i < arrearList.length; i++) {
      totalArrears = int.parse(arrearList.elementAt(i).amount) + totalArrears;
    }
    return totalArrears.toString();
  }
}
