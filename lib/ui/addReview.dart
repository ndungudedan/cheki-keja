import 'package:cheki_keja/connection/networkApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddReview extends StatefulWidget {
  String apartmentId;
  String userId;
  AddReview({Key key,  this.apartmentId,  this.userId}) : super(key: key);
  
  final String title = 'Reviews';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddReview> {
  var _cleanValue = 0;
  var _secureValue = 0;
  final _formKey = GlobalKey<FormState>();
  Map<String, String> data = {};
  SharedPreferences prefs;

  @override
  void initState() {
    initPrefs();
    data['userId'] = widget.userId;
    data['apartmentId'] = widget.apartmentId;
    data['rating'] = '5';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              data['rating'] = rating.toString();
            },
          )),
          Container(
            child: Column(
              children: <Widget>[
                Text('How would you rate the cleanliness of the apartment?'),
                RadioListTile(
                    title: Text('Very Clean'),
                    groupValue: _cleanValue,
                    activeColor: Colors.blue,
                    value: 5,
                    selected: true,
                    onChanged: (val) {
                      setState(() {
                        _cleanValue=val;
                        data['cleanliness'] = 'Very Clean';
                      });
                    }),
                RadioListTile(
                    title: Text('Clean'),
                    groupValue: _cleanValue,
                    activeColor: Colors.blue,
                    value: 4,
                    onChanged: (val) {
                      setState(() {
                        _cleanValue=val;
                        data['cleanliness'] = 'Clean';
                      });
                    }),
                RadioListTile(
                    title: Text('Dirty'),
                    groupValue: _cleanValue,
                    activeColor: Colors.blue,
                    value: 3,
                    onChanged: (val) {
                      setState(() {
                        _cleanValue=val;
                        data['cleanliness'] = 'Dirty';
                      });
                    }),
                RadioListTile(
                    title: Text('Very Dirty'),
                    groupValue: _cleanValue,
                    activeColor: Colors.blue,
                    value: 2,
                    onChanged: (val) {
                      setState(() {
                        _cleanValue=val;
                        data['cleanliness'] = 'Very Dirty';
                      });
                    }),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('How would you rate the security of the apartment?'),
                RadioListTile(
                    title: Text('Very Secure'),
                    groupValue: _secureValue,
                    value: 5,
                    selected: true,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        _secureValue=val;
                        data['security'] = 'Very Secure';
                      });
                    }),
                RadioListTile(
                    title: Text('Secure'),
                    groupValue: _secureValue,
                    value: 4,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        _secureValue=val;
                        data['security'] = 'Secure';
                      });
                    }),
                RadioListTile(
                    title: Text('Insecure'),
                    groupValue: _secureValue,
                    value: 3,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        _secureValue=val;
                        data['security'] = 'Insecure';
                      });
                    }),
                RadioListTile(
                    title: Text('Very Insecure'),
                    groupValue: _secureValue,
                    value: 2,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        _secureValue=val;
                        data['security'] = 'Very Insecure';
                      });
                    }),
              ],
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (text) {
                  data['review'] = text;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(),
                                    ), 
                    hintText: 'Write Review'),
              ),
            ),
          ),
          OutlineButton(
            child: Text('Submit'),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                data['userId'] = prefs.getString('userId');
                var result = await NetworkApi().addReview(data);
                print(result);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
