import 'package:flutter/material.dart';

class Constants {
  final String baseurl = 'http://192.168.43.188/chekiKeja/chekiKeja.php/';
  final String uploadurl = 'http://192.168.43.188/chekiKeja/tengenezaKeja.php/';
  final String updateurl = 'http://192.168.43.188/chekiKeja/updateKeja.php/';
  final String path = 'http://192.168.43.188/chekiKeja/uploads/';
  final String stkpush = 'http://www.thebuktu.com/chekiKeja/lipaNaMpesa.php';
  final String termsurl = 'http://192.168.43.188/chekiKeja/uploads/terms.rtf';
  final String abouturl = 'http://192.168.43.188/chekiKeja/uploads/about.rtf';
  final String folder = '/images/';

  final String firstlogin = 'firstlogin';
  final String account = 'account';
  final String userid = 'userid';
  final String phone = 'phone';
  final String firstname = 'firstname';
  final String surname = 'surname';
  final String email = 'email';
  final String photo = 'photo';
  final String balance = 'balance';

  static final fail = '0'; //network query failed
  static final success = '1'; //network query successful

  final bizNo = '174379';
  final passKey =
      'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919';
  final phoneNo = '254700314700';
  final paymentDeposit = 'deposit';
  final paymentRent = 'rent';

  static final jan = '1';
  static final dec = '12';

  static final imagestable = 'images_table';
  static final tagstable = 'tags_table';
  static final featurestable = 'features_table';
  static final apartmenttable = 'apartment_table';
  static final paymenthistorytable = 'payment_history_table';
  static final homesummarytable = 'home_summary_table';
  static final transactionstable = 'transactions_table';
  static final tenanttable = 'tenant_table';
}

class SharedPrefs {
  static final firstlogin = 'firstlogin';
  static final signedIn = 'signedIn';
  static final account = 'account';
  static final userid = 'userid';
  static final phone = 'phone';
  static final firstname = 'firstname';
  static final surname = 'surname';
  static final email = 'email';
  static final password = 'password';
  static final photo = 'photo';
  static final balance = 'balance';
  static final companyid = 'companyid';
  static final companyname = 'companyname';
  static final companyemail = 'companyemail';
  static final companyphone = 'companyphone';
  static final companyaddress = 'companyaddress';
  static final companylocation = 'companylocation';
  static final companyphoto = 'companyphoto';
}

class UploadData {
  static final latitude = 'latitude';
  static final longitude = 'longitude';
  static final apartmentName = 'apartmentName';
  static final apartmentRent = 'apartmentRent';
  static final apartmentDeposit = 'apartmentDeposit';
  static final apartmentPhone = 'apartmentPhone';
  static final location = 'location';
  static final description = 'description';
  static final address = 'address';
  static final units = 'units';
  static final category = 'category';
  static final email = 'email';
  static final companyId = 'companyId';
}

class ApartmentCategory {
  static final singles = 'Single Room';
  static final doubles = 'Double Room';
  static final bedsitter = 'Bed Sitter';
  static final one_bed = 'One Bedroom';
  static final two_bed = 'Two Bedroom';
  static final three_bed = 'Three Bedroom';
  //static final four_bed = 'Four Bedroom';

  static final single_id = '1';
  static final double_id = '2';
  static final bedsitter_id = '4';
  static final one_bed_id = '5';
  static final two_bed_id = '11';
  static final three_bed_id = '12';
  //static final four_bed_id = 'Four Bedroom';
}

// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);
const greyPlaceHolder = Color.fromARGB(255,128, 128, 128);
const lightgreyPlaceHolder = Color.fromARGB(255,207, 212, 219);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
