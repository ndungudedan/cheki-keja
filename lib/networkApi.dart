import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'network.dart';

//const url='http://192.168.43.247/chekiKeja/chekiKeja.php';
const url = 'http://www.thebuktu.com/chekiKeja/chekiKeja.php';
const stkpush = 'http://www.thebuktu.com/chekiKeja/lipaNaMpesa.php';

class NetworkApi {
  // 5
  Future<dynamic> getApartments(var id, var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getData(homejson(id, userId));
    return Data;
  }

  Future<dynamic> getMyhouse(var userId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getMyhouse(myhousejson(userId));
    return Data;
  }

  Future<dynamic> getArrears(var userId, var apartmentId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getArrears(arrearsjson(userId, apartmentId));
    return Data;
  }

  Future<dynamic> getFavorites(var id, var userId) async {
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

  Future<dynamic> getImages() async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getData(imagejson());
    return Data;
  }

  Future<dynamic> getReviews(String apartmentId, var paginationId) async {
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

  Future<dynamic> getFeatures(String apartmentId) async {
    // 6
    Network network = Network('$url');
    // 7
    var Data = await network.getFeatures(getFeaturesJson(apartmentId));
    return Data;
  }

  Future<dynamic> getCompany(String ownerId) async {
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

  Future<dynamic> registerUser(FirebaseUser user) async {
    Network network = Network('$url');
    // 7
    var Data = await network.registerUser(userJson(user));
    return Data;
  }

  String homejson(var id, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'homePage',
      'pagination': id,
      'user_id': userId,
    });
    return json;
  }

  String favoritejson(var id, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'Favorites',
      'pagination': id,
      'user_id': userId,
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

  String imagejson() {
    var json = jsonEncode(<String, String>{
      'functionality': 'retreiveImages',
    });
    return json;
  }

  String likejson(var apartmentId, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'addLike',
      'apartmentId': apartmentId,
      'userId': userId,
    });
    return json;
  }

  String dislikejson(var apartmentId, var userId) {
    var json = jsonEncode(<String, String>{
      'functionality': 'disLike',
      'apartmentId': apartmentId,
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

  String userJson(FirebaseUser user) {
    var json = jsonEncode(<String, String>{
      'functionality': 'registerUser',
      'email': user.email,
      'photo': user.photoUrl,
      'name': user.displayName,
    });
    return json;
  }
}
