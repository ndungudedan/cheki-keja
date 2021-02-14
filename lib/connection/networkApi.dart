import 'dart:convert';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/company.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'network.dart';


Constants constants = Constants();
var url = constants.baseurl;
var stkpush = constants.stkpush;

class NetworkApi {
  Future<List<MyApartment>> getApartments(var id, var userId) {
    Network network = Network('$url');
    var data = network.getData(homejson(id, userId));
    print(data.toString());
    return data;
  }

   Future<List<MyApartment>> getSectionCategorys(var id) {
    Network network = Network('$url');
    var data = network.getSectionCategorys(sectionCategorysjson(id));
    print(data.toString());
    return data;
  }

  Future<dynamic> getMyhouse(var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getMyhouse(myhousejson(userId));
    return Data;
  }

  Future<dynamic> getContacts() async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.call(contactsjson());
    return Data;
  }

  Future<dynamic> getArrears(var userId, var apartmentId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getArrears(arrearsjson(userId, apartmentId));
    return Data;
  }

  Future<List<MyApartment>> getFavorites(var id, var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getFavorites(favoritejson(id, userId));
    return Data;
  }

  // 8
  Future<dynamic> getApartmentImage(String imageUrl) async {
    Network network = Network('$imageUrl');
    var Data = await network.getImage();
    return Data;
  }

  Future<dynamic> getImages(var apartmentId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getImages(imagejson(apartmentId));
    return Data;
  }
    Future<dynamic> getApartmentLocations() async {
    Network network = Network(constants.baseurl);
    var data = await network.call(locationsjson());
    return data;
  }
  Future<List<Review>> getReviews(String apartmentId, var paginationId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data =
        await network.getReviews(getReviewJson(apartmentId, paginationId));
    return Data;
  }

  Future<dynamic> getComplains(String apartmentId, var paginationId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data =
        await network.getComplains(getComplainsJson(apartmentId, paginationId));
    return Data;
  }

  Future<dynamic> getComplainChats(
      String apartmentId, var complainId, var paginationId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getComplainChats(
        getComplainChatsJson(apartmentId, complainId, paginationId));
    return Data;
  }

  Future<List<Features>>getFeatures(String apartmentId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getFeatures(getFeaturesJson(apartmentId));
    return Data;
  }

  Future<MyCompany> getCompany(String ownerId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getCompany(getCompanyJson(ownerId));
    return Data;
  }

  Future<dynamic> lipaNaMpesa(var phone, var amount, var userId,
      var apartmentId, var ownerId, var type) async {
    // 6
    Network network = Network('$stkpush');
    // 7
    var Data = await network.lipaNaMpesa(
        lipaNaMpesajson(phone, amount, userId, apartmentId, ownerId, type));
    return Data;
  }

  Future upload(
      var video, var images, var tags, var features, var details) async {
    // 6
    Network network = Network('$url');
    // 7
    var res = await network.uploads(video, images, tags, features, details);
    return res;
  }

  Future<dynamic> addLike(var id, var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.addLike(likejson(id, userId));
    return Data;
  }

  Future<dynamic> disLike(var id, var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.disLike(dislikejson(id, userId));
    return Data;
  }

  Future<dynamic> addReview(var data) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.addReview(reviewjson(data));
    return Data;
  }

  Future<dynamic> addComplain(
      var apartId, var userId, var title, var desc) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data =
        await network.addComplain(complainjson(apartId, userId, title, desc));
    return Data;
  }

  Future<dynamic> registerUser(auth.User user) async {
    Network network = Network('$url');
    // 7
    var Data = await network.registerUser(userJson(user));
    return Data;
  }

    Future<dynamic> updateFirebaseToken() async {
    Network network = Network('$url');
    var Data = await network.call(tokenJson());
    return Data;
  }

  String homejson(var id, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'homePage',
      'pagination': id,
      'userId': userId,
    });
    return json;
  }
    String tokenJson() {
    var json = jsonEncode(<String, String>{
      'functionality': 'updateFirebaseToken',
      'token': sharedPreferences.getFirebaseToken(),
      'userId': sharedPreferences.getUserId(),
    });
    return json;
  }
    String sectionCategorysjson(var id) {
    var json = jsonEncode(<String, String>{
      'functionality': 'fetchByCategory',
      'categoryId': id,
      'pagination': '0',
    });
    return json;
  }

  String favoritejson(var id, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'Favorites',
      'pagination': id,
      'userId': userId,
    });
    return json;
  }

  String getReviewJson(String apartmentId, var paginationId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getReviews',
      'apartmentId': apartmentId,
      'pagination': paginationId,
    });
    return json;
  }

  String getComplainsJson(String apartmentId, var paginationId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getComplains',
      'apartmentId': apartmentId,
      'pagination': paginationId,
    });
    return json;
  }

  String getComplainChatsJson(
      String apartmentId, var complainId, var paginationId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getComplainsChats',
      'apartmentId': apartmentId,
      'complainId': complainId,
      'pagination': paginationId,
    });
    return json;
  }

  String getFeaturesJson(String apartmentId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getFeatures',
      'apartmentId': apartmentId,
    });
    return json;
  }

  String getCompanyJson(String ownerId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getCompany',
      'ownerId': ownerId,
    });
    return json;
  }

  String imagejson(var apartmentId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'retreiveImages',
      'apartmentId': apartmentId,
    });
    return json;
  }
  String locationsjson() {
    var json = jsonEncode(<String, String>{
      'functionality':'getLocations',
    });
    return json;
  }

  String likejson(var apartmentId, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'addLike',
      'apartmentId': apartmentId.toString(),
      'userId': userId,
    });
    return json;
  }

  String dislikejson(var apartmentId, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'disLike',
      'apartmentId': apartmentId.toString(),
      'userId': userId,
    });
    return json;
  }

  String myhousejson(var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getPayments',
      'userId': userId,
    });
    return json;
  }
   String contactsjson() {
    var json = jsonEncode(<String, String>{
      'functionality': 'getContacts',
    });
    return json;
  }

  String lipaNaMpesajson(
      var phone, var amount, var userId, var apartmentId, ownerId, var type) {
    var json = jsonEncode(<String, String>{
      'functionality': 'lipaNaMpesa',
      'phone': phone,
      'amount': amount,
      'apartmentId': apartmentId,
      'userId': userId,
      'ownerId': ownerId,
      'type': type,
    });
    return json;
  }

  String arrearsjson(var userId, var apartmentId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'getArrears',
      'userId': userId,
      'apartmentId': apartmentId,
    });
    return json;
  }

  String complainjson(var apartmentId, var userId, var title, var desc) {
    var json = jsonEncode(<String, String>{
      'functionality': 'addComplain',
      'userId': userId,
      'apartmentId': apartmentId,
      'title': title,
      'description': desc,
    });
    return json;
  }

  String reviewjson(var data) {
    var json = jsonEncode(<String, String>{
      'functionality': 'addReview',
      'rating': data['rating'],
      'review': data['review'],
      'cleanliness': data['cleanliness'],
      'security': data['security'],
      'userId': data['userId'],
      'apartmentId': data['apartmentId'],
    });
    return json;
  }

  String userJson(auth.User user) {
    var json = jsonEncode(<String, String>{
      'functionality': 'registerUser',
      'email': user.email,
      'photo': user.photoURL,
      'name': user.displayName,
      'token': sharedPreferences.getFirebaseToken() ?? '',
    });
    return json;
  }
}
