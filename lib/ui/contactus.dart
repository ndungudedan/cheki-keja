import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  Constants constants = Constants();

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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Container(
            child: ListView(
              children: <Widget>[
                ConnectionCallback(
          onlineCall: () {},
        ),
                ListTile(
                  title: Text('Phone'),
                  leading: Icon(Icons.call,color: Colors.red,),
                  subtitle: Text('tel:0700314700'),
                ),
                ListTile(
                  onTap: () {
                    launch('mailto:adminkeja@gmail.com');
                  },
                  title: Text('Email'),
                  leading: Icon(Icons.email,color: Colors.red,),
                  subtitle: Text('adminkeja@gmail.com'),
                ),
                ListTile(
                  title: Text('Address'), 
                  leading: Icon(Icons.account_box,color: Colors.red,),
                  subtitle: Text('255-00200' + '\n' + 'Nairobi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
