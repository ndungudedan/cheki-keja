import 'package:cheki_keja/blocs/contactbloc.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<ContactUs> {
  Constants constants = Constants();
  ContactBloc contactBloc;
  var dao = DatabaseDao(databasehelper);

  @override
  void initState() {
    contactBloc = ContactBloc();
    contactBloc.fetchContacts();
    super.initState();
  }

  @override
  void dispose() {
    contactBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Contact Us'),
      ),
      body: ListView(
        children: <Widget>[
          ConnectionCallback(
            onlineCall: () {},
          ),
          StreamBuilder(
            stream: dao.watchContacts(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.isNotEmpty) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      onTap: (){
                        launch('tel:+254'+snapshot.data[0].phone.toString().substring(1));
                      },
                      title: Text('Phone'),
                      leading: Icon(
                        Icons.call,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].phone),
                    ),
                    ListTile(
                      onTap: () {
                        launch('mailto:' + snapshot.data[0].email);
                      },
                      title: Text('Email'),
                      leading: Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].email),
                    ),
                    ListTile(
                      title: Text('Address'),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].address +
                          '\n' +
                          snapshot.data[0].location),
                    ),
                    ListTile(
                      title: Text('Instagram'),
                      leading: Icon(
                        Icons.call,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].instagram),
                    ),
                    ListTile(
                      onTap: () {
                        launch('mailto:' + snapshot.data[0].email);
                      },
                      title: Text('Facebook'),
                      leading: Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].facebook),
                    ),
                    ListTile(
                      title: Text('Twitter'),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.red,
                      ),
                      subtitle: Text(snapshot.data[0].twitter),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('No data'),
                );
              } else if (snapshot.data != null && snapshot.data.isEmpty) {
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
      ),
    );
  }
}
