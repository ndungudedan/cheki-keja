import 'dart:convert';

import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/category.dart';
import 'package:cheki_keja/models/company.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:cheki_keja/ui/reviews.dart';
import 'package:http/http.dart' as http;
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class Network {
  final String url;
  Network(this.url);
  Future call(String json) async {
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
      return Constants.fail;
    }
  }
  
  Future<List<MyApartment>> getData(String val) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: val,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return MyApartmentResponse.fromJson(json.decode(response.body))
          .data
          .apartments;
    } else {
      print(response.statusCode);
    }
  }
  Future<List<MyApartment>> getSectionCategorys(String val) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: val,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return MyApartmentResponse.fromJson(json.decode(response.body)).data.apartments;
    } else {
      print(response.statusCode);
    }
  }

    Future<List<Images>> getImages(String val) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: val,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return ImagesResponse.fromJson(json.decode(response.body)).data.data;
    } else {
      print(response.statusCode);
    }
  }

  Future<List<MyApartment>> getFavorites(String value) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: value,
    );
    if (response.statusCode == 200) {
      return MyApartmentResponse.fromJson(json.decode(response.body))
          .data
          .apartments;
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

  Future<List<Review>> getReviews(String value) async {
    print('Calling uri: $url');
    //Response response = await get(url);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: value,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return ReviewList.fromJson(json.decode(response.body)).reviews;
    } else {
      print(response.statusCode);
    }
  }

  Future<List<Features>> getFeatures(String value) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: value,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return FeaturesResponse.fromJson(json.decode(response.body)).data.data;
    } else {
      print(response.statusCode);
    }
  }

  Future<MyCompany> getCompany(String value) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: value,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return CompanyResponse.fromJson(json.decode(response.body)).data;
    } else {
      print(response.statusCode);
    }
  }

  Future<Myhouse> getMyhouse(String value) async {
    print('Calling uri: $url');
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: value,
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Myhouse.fromJson(json.decode(response.body));
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
