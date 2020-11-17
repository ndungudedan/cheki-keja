// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentsClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payments _$PaymentsFromJson(Map<String, dynamic> json) {
  return Payments(
    id: json['id'] as String,
    transaction_id: json['transaction_id'] as String,
    category: json['category'] as String,
    title: json['title'] as String,
    amount: json['amount'] as String,
    status: json['status'] as String,
    time: json['time'] as String,
    month: json['month'] as String,
    type: json['type'] as String,
    year: json['year'] as String,
  );
}

Map<String, dynamic> _$PaymentsToJson(Payments instance) => <String, dynamic>{
      'id': instance.id,
      'transaction_id': instance.transaction_id,
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
    payments: (json['payments'] as List)
        ?.map((e) =>
            e == null ? null : Payments.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
        : PaymentsList.fromJson(json['paymentsList'] as List),
    details: json['details'] == null
        ? null
        : Details.fromJson(json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyhouseToJson(Myhouse instance) => <String, dynamic>{
      'paymentsList': instance.paymentsList,
      'details': instance.details,
    };

Arrears _$ArrearsFromJson(Map<String, dynamic> json) {
  return Arrears(
    id: json['id'] as String,
    amount: json['amount'] as String,
    month: json['month'] as String,
    year: json['year'] as String,
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
    arrears: (json['arrears'] as List)
        ?.map((e) =>
            e == null ? null : Arrears.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArrearsListToJson(ArrearsList instance) =>
    <String, dynamic>{
      'arrears': instance.arrears,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details(
    id: json['id'] as String,
    owner_id: json['owner_id'] as String,
    owner_name: json['owner_name'] as String,
    owner_logo: json['owner_logo'] as String,
    owner_address: json['owner_address'] as String,
    owner_email: json['owner_email'] as String,
    owner_location: json['owner_location'] as String,
    owner_phone: json['owner_phone'] as String,
    category: json['category'] as String,
    deposit: json['deposit'] as String,
    price: json['price'] as String,
    title: json['title'] as String,
    payed: json['payed'] as String,
    rating: json['rating'] as String,
  );
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'owner_name': instance.owner_name,
      'owner_logo': instance.owner_logo,
      'owner_phone': instance.owner_phone,
      'owner_address': instance.owner_address,
      'owner_location': instance.owner_location,
      'owner_email': instance.owner_email,
      'title': instance.title,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'payed': instance.payed,
      'deposit': instance.deposit,
    };
