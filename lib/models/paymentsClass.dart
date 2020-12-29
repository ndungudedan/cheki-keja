import 'package:json_annotation/json_annotation.dart';
part 'paymentsClass.g.dart';

@JsonSerializable()
class Payments {
  String id;
  String transaction_id;
  String category;
  String title;
  String amount;
  String status;
  String time;
  String year;
  String month;
  String type;

  Payments({
    this.id,
    this.transaction_id,
    this.category,
    this.title,
    this.amount,
    this.status,
    this.time,
    this.month,
    this.type,
    this.year,
  });

  factory Payments.fromJson(Map<String, dynamic> json) =>
      _$PaymentsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsToJson(this);
}

@JsonSerializable()
class PaymentsList {
  List<Payments> payments;

  PaymentsList({this.payments});

  factory PaymentsList.fromJson(List<dynamic> json) {
    return PaymentsList(
        payments: json
            .map((e) => Payments.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Myhouse {
  PaymentsList paymentsList;
  ArrearsList arrearsList;
  Details details;

  Myhouse({
    this.paymentsList,
    this.details,
    this.arrearsList,
  });

  factory Myhouse.fromJson(Map<String, dynamic> json) =>
      _$MyhouseFromJson(json);

  Map<String, dynamic> toJson() => _$MyhouseToJson(this);
}

@JsonSerializable()
class Arrears {
  String id;
  String amount;
  String year;
  String month;

  Arrears({
    this.id,
    this.amount,
    this.month,
    this.year,
  });

  factory Arrears.fromJson(Map<String, dynamic> json) =>
      _$ArrearsFromJson(json);

  Map<String, dynamic> toJson() => _$ArrearsToJson(this);
}

@JsonSerializable()
class ArrearsList {
  List<Arrears> arrears;

  ArrearsList({this.arrears});

  factory ArrearsList.fromJson(List<dynamic> json) {
    return ArrearsList(
        arrears: json
            .map((e) => Arrears.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Details {
  String id;
  String owner_id;
  String owner_name;
  String owner_logo;
  String owner_phone;
  String owner_address;
  String owner_location;
  String owner_email;
  String title;
  String category;
  String price;
  String rating;
  String payed;
  String deposit;
  String unit;

  Details({
    this.id,
    this.owner_id,
    this.owner_name,
    this.owner_logo,
    this.owner_address,
    this.owner_email,
    this.owner_location,
    this.owner_phone,
    this.category,
    this.unit,
    this.deposit,
    this.price,
    this.title,
    this.payed,
    this.rating,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
