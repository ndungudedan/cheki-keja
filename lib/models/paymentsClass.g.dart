// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentsClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payments _$PaymentsFromJson(Map<String, dynamic> json) {
  return Payments(
    id: json['id'] as String?,
    transactionid: json['transactionid'] as String?,
    category: json['category'] as String?,
    title: json['title'] as String?,
    amount: json['amount'] as String?,
    status: json['status'] as String?,
    time: json['time'] as String?,
    month: json['month'] as String?,
    type: json['type'] as String?,
    year: json['year'] as String?,
  );
}

Map<String, dynamic> _$PaymentsToJson(Payments instance) => <String, dynamic>{
      'id': instance.id,
      'transactionid': instance.transactionid,
      'category': instance.category,
      'title': instance.title,
      'amount': instance.amount,
      'status': instance.status,
      'time': instance.time,
      'year': instance.year,
      'month': instance.month,
      'type': instance.type,
    };

PaymentsList _$PaymentsListFromJson(Map<String, dynamic> json) {
  return PaymentsList(
    payments: (json['payments'] as List<dynamic>?)
        ?.map((e) => Payments.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PaymentsListToJson(PaymentsList instance) =>
    <String, dynamic>{
      'payments': instance.payments,
    };

Myhouse _$MyhouseFromJson(Map<String, dynamic> json) {
  return Myhouse(
    paymentsList: json['paymentsList'] == null
        ? null
        : PaymentsList.fromJson(json['paymentsList'] as List<dynamic>),
    details: json['details'] == null
        ? null
        : Details.fromJson(json['details'] as Map<String, dynamic>),
    arrearsList: json['arrearsList'] == null
        ? null
        : ArrearsList.fromJson(json['arrearsList'] as List<dynamic>),
  );
}

Map<String, dynamic> _$MyhouseToJson(Myhouse instance) => <String, dynamic>{
      'paymentsList': instance.paymentsList,
      'arrearsList': instance.arrearsList,
      'details': instance.details,
    };

Arrears _$ArrearsFromJson(Map<String, dynamic> json) {
  return Arrears(
    id: json['id'] as String?,
    amount: json['amount'] as String?,
    month: json['month'] as String?,
    year: json['year'] as String?,
  );
}

Map<String, dynamic> _$ArrearsToJson(Arrears instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'year': instance.year,
      'month': instance.month,
    };

ArrearsList _$ArrearsListFromJson(Map<String, dynamic> json) {
  return ArrearsList(
    arrears: (json['arrears'] as List<dynamic>?)
        ?.map((e) => Arrears.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArrearsListToJson(ArrearsList instance) =>
    <String, dynamic>{
      'arrears': instance.arrears,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details(
    id: json['id'] as String?,
    ownerid: json['ownerid'] as String?,
    ownername: json['ownername'] as String?,
    ownerlogo: json['ownerlogo'] as String?,
    owneraddress: json['owneraddress'] as String?,
    owneremail: json['owneremail'] as String?,
    ownerlocation: json['ownerlocation'] as String?,
    ownerphone: json['ownerphone'] as String?,
    category: json['category'] as String?,
    unit: json['unit'] as String?,
    deposit: json['deposit'] as String?,
    price: json['price'] as String?,
    title: json['title'] as String?,
    payed: json['payed'] as String?,
    rating: json['rating'] as String?,
  );
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'id': instance.id,
      'ownerid': instance.ownerid,
      'ownername': instance.ownername,
      'ownerlogo': instance.ownerlogo,
      'ownerphone': instance.ownerphone,
      'owneraddress': instance.owneraddress,
      'ownerlocation': instance.ownerlocation,
      'owneremail': instance.owneremail,
      'title': instance.title,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'payed': instance.payed,
      'deposit': instance.deposit,
      'unit': instance.unit,
    };
