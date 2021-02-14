import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
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
  var _cleanValue = 5;
  var _secureValue = 5;
  final _formKey = GlobalKey<FormState>();
  Map<String, String> data = {};
  SharedPreferences prefs;

  @override
  void initState() {
    initPrefs();
    data['userId'] = widget.userId;
    data['apartmentId'] = widget.apartmentId;
    data['rating'] = '5';
    data['cleanliness'] = 'Very Clean';
    data['security'] = 'Very Secure';
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
          ConnectionCallback(
          onlineCall: () {},
        ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 10,
                            child: Center(
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
            ),
                            ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('How would you rate the cleanliness of the apartment?'),
                RadioListTile(
                    title: Text('Very Clean',style: TextStyle(
                      color: _cleanValue==5 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Clean',style: TextStyle(
                      color: _cleanValue==4 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Dirty',style: TextStyle(
                      color: _cleanValue==3 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Very Dirty',style: TextStyle(
                      color: _cleanValue==2 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Very Secure',style: TextStyle(
                      color: _secureValue==5 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Secure',style: TextStyle(
                      color: _secureValue==4 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Insecure',style: TextStyle(
                      color: _secureValue==3 ? Colors.blue :Colors.black
                    ),),
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
                    title: Text('Very Insecure',style: TextStyle(
                      color: _secureValue==2 ? Colors.blue :Colors.black
                    ),),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              color: Color.fromARGB(255, 238, 133, 57),
              child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.white),),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  data['userId'] = sharedPreferences.getUserId();
                  var result = await NetworkApi().addReview(data);
                  print(result);
                  Navigator.pop(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
