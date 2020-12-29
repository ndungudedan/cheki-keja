import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Terms extends StatelessWidget {
  Constants constants=Constants();

  Future<String> makePostRequest() async {
    Response response = await post(constants.termsurl);

    if(response.statusCode==200){
      String responseBody = response.body;
    print(responseBody);
    return responseBody;
    }
    else{
      String responseBody = response.body;
    print(responseBody);
    return "No data";
    }
  }

  @override
  Widget build(BuildContext context) {
    makePostRequest();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Terms and Conditions'),
        ),
          body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              ConnectionCallback(
          onlineCall: () {},
        ),
              FutureBuilder<String>(
                  future: makePostRequest(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Text(snapshot.data);
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}