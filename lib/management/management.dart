import 'dart:convert';
import 'dart:typed_data';
import 'package:cheki_keja/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManagement {
  static SharedPreferences? sharedPreferences;
  init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  @override
  String saveImage(String userId, String key, Uint8List image) {
    final base64Image = Base64Encoder().convert(image);
    sharedPreferences!.setString(SharedPrefs.photo, base64Image);
    return key;
  }

  @override
  Uint8List? getImage(String userId, String key) {
    final base64Image = sharedPreferences!.getString(SharedPrefs.photo);
    if (base64Image != null) return Base64Decoder().convert(base64Image);
    return null;
  }

  checkFirstTime() {
    return sharedPreferences!.containsKey(SharedPrefs.firstlogin);
  }
  checkSignedIn() {
    return sharedPreferences!.containsKey(SharedPrefs.signedIn);
  }

  checkEmail() {
    return sharedPreferences!.containsKey(SharedPrefs.email);
  }

  void setOnline(bool val) {
     sharedPreferences!.setBool(SharedPrefs.online, val);
  }
  void setFirebaseToken(var val) {
     sharedPreferences!.setString(SharedPrefs.firebasetoken, val);
  }

  void setEmail(var val) {
    sharedPreferences!.setString(SharedPrefs.email, val);
  }

  void setPassword(var val) {
    sharedPreferences!.setString(SharedPrefs.password, val);
  }

  void setCompanyId(var val) {
    sharedPreferences!.setString(SharedPrefs.companyid, val);
  }

  void setUserId(var val) {
    sharedPreferences!.setString(SharedPrefs.userid, val);
  }

  void setPhone(var val) {
    sharedPreferences!.setString(SharedPrefs.phone, val);
  }

  void setPhoto(var val) {
    sharedPreferences!.setString(SharedPrefs.photo, val);
  }

  void setIdNo(var val) {
    sharedPreferences!.setString(SharedPrefs.id_no, val);
  }

  void setCitizenship(var val) {
    sharedPreferences!.setString(SharedPrefs.citizenship, val);
  }

  void setSurname(var val) {
    sharedPreferences!.setString(SharedPrefs.surname, val);
  }

  void setFirstname(var val) {
    sharedPreferences!.setString(SharedPrefs.firstname, val);
  }

  void setFirstLogin(var val) {
    sharedPreferences!.setBool(SharedPrefs.firstlogin, val);
  }

  void setSignedIn(var val) {
    sharedPreferences!.setBool(SharedPrefs.signedIn, val);
  }

  void setCompanyName(var val) {
    sharedPreferences!.setString(SharedPrefs.companyname, val);
  }

  void setCompanyPhone(var val) {
    sharedPreferences!.setString(SharedPrefs.companyphone, val);
  }

  void setCompanyAddress(var val) {
    sharedPreferences!.setString(SharedPrefs.companyaddress, val);
  }

  void setCompanyEmail(var val) {
    sharedPreferences!.setString(SharedPrefs.companyemail, val);
  }

  void setCompanyLocation(var val) {
    sharedPreferences!.setString(SharedPrefs.companylocation, val);
  }

  void setCompanyPhoto(String image) {
    sharedPreferences!.setString(SharedPrefs.companyphoto, image);
  }

  getOnline() {
    return sharedPreferences!.getBool(SharedPrefs.online);
  }

  getFirebaseToken() {
    return sharedPreferences!.getString(SharedPrefs.firebasetoken);
  }

  getEmail() {
    return sharedPreferences!.getString(SharedPrefs.email);
  }

  getPassword() {
    return sharedPreferences!.getString(SharedPrefs.password);
  }

  getPhone() {
    return sharedPreferences!.getString(SharedPrefs.phone);
  }

  getPhoto() {
    return sharedPreferences!.getString(SharedPrefs.photo);
  }

  getUserId() {
    return sharedPreferences!.getString(SharedPrefs.userid);
  }

  getCompanyId() {
    return sharedPreferences!.getString(SharedPrefs.companyid);
  }

  getSurname() {
    return sharedPreferences!.getString(SharedPrefs.surname);
  }

  getFirstLogin() {
    return sharedPreferences!.getBool(SharedPrefs.firstlogin);
  }

  getSignedIn() {
    if (sharedPreferences!.containsKey(SharedPrefs.signedIn)) {
      return sharedPreferences!.getBool(SharedPrefs.signedIn);
    } else {
      return sharedPreferences!.containsKey(SharedPrefs.signedIn);
    }
  }

  getFirstname() {
    return sharedPreferences!.getString(SharedPrefs.firstname);
  }

  @override
  String? getCompanyPhoto() {
    final base64Image = sharedPreferences!.getString(SharedPrefs.companyphoto);
    if (base64Image != null) return base64Image;
    return null;
  }

  getCompanyAddress() {
    return sharedPreferences!.getString(SharedPrefs.companyaddress);
  }

  getCompanyEmail() {
    return sharedPreferences!.getString(SharedPrefs.companyemail);
  }

  getCompanyLocation() {
    return sharedPreferences!.getString(SharedPrefs.companylocation);
  }

  getCompanyName() {
    return sharedPreferences!.getString(SharedPrefs.companyname);
  }

  getCompanyPhone() {
    return sharedPreferences!.getString(SharedPrefs.companyphone);
  }
}

final sharedPreferences = SharedPrefsManagement();
