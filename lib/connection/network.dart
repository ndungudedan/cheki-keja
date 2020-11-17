// 1
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class Network {
  final String url;
  Network(this.url);

  Future getData(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
  Future getFavorites(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getImage() async {
    /* print('Calling uri: $url');
    
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    } */
  }

  Future uploads(
      var video, var images, var tags, var features, var details) async {
    Dio dio = new Dio();
    List imageArray = [];
    for (var i = 1; i < images.length; i++) {
      imageArray.add(MultipartFile.fromFile(images[i],
          filename: basename(images[i].toString())));
    }

    FormData formData = FormData.fromMap({
      'functionality': 'createApartment',
      'details': details,
      'tags': tags,
      'features': features,
      'video':
          await MultipartFile.fromFile(video.toString(), filename: 'video'),
      'images': imageArray
    });
    var response = await dio.post(url, data: formData);
    return response;
  }

  Future addLike(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

   Future disLike(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future addReview(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future addComplain(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future registerUser(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getReviews(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getFeatures(String json) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getCompany(String json) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getMyhouse(String json) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getArrears(String json) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future getComplains(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

   Future getComplainChats(String json) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future lipaNaMpesa(String json) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
