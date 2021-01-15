// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databasehelper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MyApartmentTableData extends DataClass
    implements Insertable<MyApartmentTableData> {
  final int id;
  final String onlineid;
  final String banner;
  final String bannertag;
  final String ownerid;
  final String ownername;
  final String ownerlogo;
  final String description;
  final String title;
  final String category;
  final String emailaddress;
  final String location;
  final String address;
  final String phone;
  final String video;
  final String price;
  final String deposit;
  final String space;
  final String latitude;
  final String longitude;
  final String rating;
  final String likes;
  final String liked;
  final String comments;
  MyApartmentTableData(
      {@required this.id,
      @required this.onlineid,
      @required this.banner,
      @required this.bannertag,
      @required this.ownerid,
      @required this.ownername,
      @required this.ownerlogo,
      this.description,
      @required this.title,
      @required this.category,
      this.emailaddress,
      this.location,
      this.address,
      this.phone,
      this.video,
      @required this.price,
      @required this.deposit,
      @required this.space,
      @required this.latitude,
      @required this.longitude,
      @required this.rating,
      @required this.likes,
      @required this.liked,
      @required this.comments});
  factory MyApartmentTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MyApartmentTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      onlineid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid']),
      banner:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}banner']),
      bannertag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}bannertag']),
      ownerid:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ownerid']),
      ownername: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownername']),
      ownerlogo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlogo']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      emailaddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}emailaddress']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      video:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}video']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      deposit:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}deposit']),
      space:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}space']),
      latitude: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      rating:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      likes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}likes']),
      liked:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}liked']),
      comments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}comments']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || onlineid != null) {
      map['onlineid'] = Variable<String>(onlineid);
    }
    if (!nullToAbsent || banner != null) {
      map['banner'] = Variable<String>(banner);
    }
    if (!nullToAbsent || bannertag != null) {
      map['bannertag'] = Variable<String>(bannertag);
    }
    if (!nullToAbsent || ownerid != null) {
      map['ownerid'] = Variable<String>(ownerid);
    }
    if (!nullToAbsent || ownername != null) {
      map['ownername'] = Variable<String>(ownername);
    }
    if (!nullToAbsent || ownerlogo != null) {
      map['ownerlogo'] = Variable<String>(ownerlogo);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || emailaddress != null) {
      map['emailaddress'] = Variable<String>(emailaddress);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || video != null) {
      map['video'] = Variable<String>(video);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || deposit != null) {
      map['deposit'] = Variable<String>(deposit);
    }
    if (!nullToAbsent || space != null) {
      map['space'] = Variable<String>(space);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String>(longitude);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<String>(rating);
    }
    if (!nullToAbsent || likes != null) {
      map['likes'] = Variable<String>(likes);
    }
    if (!nullToAbsent || liked != null) {
      map['liked'] = Variable<String>(liked);
    }
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<String>(comments);
    }
    return map;
  }

  MyApartmentTableCompanion toCompanion(bool nullToAbsent) {
    return MyApartmentTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      onlineid: onlineid == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineid),
      banner:
          banner == null && nullToAbsent ? const Value.absent() : Value(banner),
      bannertag: bannertag == null && nullToAbsent
          ? const Value.absent()
          : Value(bannertag),
      ownerid: ownerid == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerid),
      ownername: ownername == null && nullToAbsent
          ? const Value.absent()
          : Value(ownername),
      ownerlogo: ownerlogo == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerlogo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      emailaddress: emailaddress == null && nullToAbsent
          ? const Value.absent()
          : Value(emailaddress),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      video:
          video == null && nullToAbsent ? const Value.absent() : Value(video),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      deposit: deposit == null && nullToAbsent
          ? const Value.absent()
          : Value(deposit),
      space:
          space == null && nullToAbsent ? const Value.absent() : Value(space),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      likes:
          likes == null && nullToAbsent ? const Value.absent() : Value(likes),
      liked:
          liked == null && nullToAbsent ? const Value.absent() : Value(liked),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
    );
  }

  factory MyApartmentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyApartmentTableData(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      banner: serializer.fromJson<String>(json['banner']),
      bannertag: serializer.fromJson<String>(json['bannertag']),
      ownerid: serializer.fromJson<String>(json['ownerid']),
      ownername: serializer.fromJson<String>(json['ownername']),
      ownerlogo: serializer.fromJson<String>(json['ownerlogo']),
      description: serializer.fromJson<String>(json['description']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      emailaddress: serializer.fromJson<String>(json['emailaddress']),
      location: serializer.fromJson<String>(json['location']),
      address: serializer.fromJson<String>(json['address']),
      phone: serializer.fromJson<String>(json['phone']),
      video: serializer.fromJson<String>(json['video']),
      price: serializer.fromJson<String>(json['price']),
      deposit: serializer.fromJson<String>(json['deposit']),
      space: serializer.fromJson<String>(json['space']),
      latitude: serializer.fromJson<String>(json['latitude']),
      longitude: serializer.fromJson<String>(json['longitude']),
      rating: serializer.fromJson<String>(json['rating']),
      likes: serializer.fromJson<String>(json['likes']),
      liked: serializer.fromJson<String>(json['liked']),
      comments: serializer.fromJson<String>(json['comments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'banner': serializer.toJson<String>(banner),
      'bannertag': serializer.toJson<String>(bannertag),
      'ownerid': serializer.toJson<String>(ownerid),
      'ownername': serializer.toJson<String>(ownername),
      'ownerlogo': serializer.toJson<String>(ownerlogo),
      'description': serializer.toJson<String>(description),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'emailaddress': serializer.toJson<String>(emailaddress),
      'location': serializer.toJson<String>(location),
      'address': serializer.toJson<String>(address),
      'phone': serializer.toJson<String>(phone),
      'video': serializer.toJson<String>(video),
      'price': serializer.toJson<String>(price),
      'deposit': serializer.toJson<String>(deposit),
      'space': serializer.toJson<String>(space),
      'latitude': serializer.toJson<String>(latitude),
      'longitude': serializer.toJson<String>(longitude),
      'rating': serializer.toJson<String>(rating),
      'likes': serializer.toJson<String>(likes),
      'liked': serializer.toJson<String>(liked),
      'comments': serializer.toJson<String>(comments),
    };
  }

  MyApartmentTableData copyWith(
          {int id,
          String onlineid,
          String banner,
          String bannertag,
          String ownerid,
          String ownername,
          String ownerlogo,
          String description,
          String title,
          String category,
          String emailaddress,
          String location,
          String address,
          String phone,
          String video,
          String price,
          String deposit,
          String space,
          String latitude,
          String longitude,
          String rating,
          String likes,
          String liked,
          String comments}) =>
      MyApartmentTableData(
        id: id ?? this.id,
        onlineid: onlineid ?? this.onlineid,
        banner: banner ?? this.banner,
        bannertag: bannertag ?? this.bannertag,
        ownerid: ownerid ?? this.ownerid,
        ownername: ownername ?? this.ownername,
        ownerlogo: ownerlogo ?? this.ownerlogo,
        description: description ?? this.description,
        title: title ?? this.title,
        category: category ?? this.category,
        emailaddress: emailaddress ?? this.emailaddress,
        location: location ?? this.location,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        video: video ?? this.video,
        price: price ?? this.price,
        deposit: deposit ?? this.deposit,
        space: space ?? this.space,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        rating: rating ?? this.rating,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        comments: comments ?? this.comments,
      );
  @override
  String toString() {
    return (StringBuffer('MyApartmentTableData(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('banner: $banner, ')
          ..write('bannertag: $bannertag, ')
          ..write('ownerid: $ownerid, ')
          ..write('ownername: $ownername, ')
          ..write('ownerlogo: $ownerlogo, ')
          ..write('description: $description, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('emailaddress: $emailaddress, ')
          ..write('location: $location, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('video: $video, ')
          ..write('price: $price, ')
          ..write('deposit: $deposit, ')
          ..write('space: $space, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('rating: $rating, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('comments: $comments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          onlineid.hashCode,
          $mrjc(
              banner.hashCode,
              $mrjc(
                  bannertag.hashCode,
                  $mrjc(
                      ownerid.hashCode,
                      $mrjc(
                          ownername.hashCode,
                          $mrjc(
                              ownerlogo.hashCode,
                              $mrjc(
                                  description.hashCode,
                                  $mrjc(
                                      title.hashCode,
                                      $mrjc(
                                          category.hashCode,
                                          $mrjc(
                                              emailaddress.hashCode,
                                              $mrjc(
                                                  location.hashCode,
                                                  $mrjc(
                                                      address.hashCode,
                                                      $mrjc(
                                                          phone.hashCode,
                                                          $mrjc(
                                                              video.hashCode,
                                                              $mrjc(
                                                                  price
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      deposit
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          space
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              latitude.hashCode,
                                                                              $mrjc(longitude.hashCode, $mrjc(rating.hashCode, $mrjc(likes.hashCode, $mrjc(liked.hashCode, comments.hashCode))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyApartmentTableData &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.banner == this.banner &&
          other.bannertag == this.bannertag &&
          other.ownerid == this.ownerid &&
          other.ownername == this.ownername &&
          other.ownerlogo == this.ownerlogo &&
          other.description == this.description &&
          other.title == this.title &&
          other.category == this.category &&
          other.emailaddress == this.emailaddress &&
          other.location == this.location &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.video == this.video &&
          other.price == this.price &&
          other.deposit == this.deposit &&
          other.space == this.space &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.rating == this.rating &&
          other.likes == this.likes &&
          other.liked == this.liked &&
          other.comments == this.comments);
}

class MyApartmentTableCompanion extends UpdateCompanion<MyApartmentTableData> {
  final Value<int> id;
  final Value<String> onlineid;
  final Value<String> banner;
  final Value<String> bannertag;
  final Value<String> ownerid;
  final Value<String> ownername;
  final Value<String> ownerlogo;
  final Value<String> description;
  final Value<String> title;
  final Value<String> category;
  final Value<String> emailaddress;
  final Value<String> location;
  final Value<String> address;
  final Value<String> phone;
  final Value<String> video;
  final Value<String> price;
  final Value<String> deposit;
  final Value<String> space;
  final Value<String> latitude;
  final Value<String> longitude;
  final Value<String> rating;
  final Value<String> likes;
  final Value<String> liked;
  final Value<String> comments;
  const MyApartmentTableCompanion({
    this.id = const Value.absent(),
    this.onlineid = const Value.absent(),
    this.banner = const Value.absent(),
    this.bannertag = const Value.absent(),
    this.ownerid = const Value.absent(),
    this.ownername = const Value.absent(),
    this.ownerlogo = const Value.absent(),
    this.description = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.emailaddress = const Value.absent(),
    this.location = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.video = const Value.absent(),
    this.price = const Value.absent(),
    this.deposit = const Value.absent(),
    this.space = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.rating = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.comments = const Value.absent(),
  });
  MyApartmentTableCompanion.insert({
    this.id = const Value.absent(),
    @required String onlineid,
    @required String banner,
    @required String bannertag,
    @required String ownerid,
    @required String ownername,
    @required String ownerlogo,
    this.description = const Value.absent(),
    @required String title,
    @required String category,
    this.emailaddress = const Value.absent(),
    this.location = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.video = const Value.absent(),
    @required String price,
    @required String deposit,
    @required String space,
    @required String latitude,
    @required String longitude,
    @required String rating,
    @required String likes,
    @required String liked,
    @required String comments,
  })  : onlineid = Value(onlineid),
        banner = Value(banner),
        bannertag = Value(bannertag),
        ownerid = Value(ownerid),
        ownername = Value(ownername),
        ownerlogo = Value(ownerlogo),
        title = Value(title),
        category = Value(category),
        price = Value(price),
        deposit = Value(deposit),
        space = Value(space),
        latitude = Value(latitude),
        longitude = Value(longitude),
        rating = Value(rating),
        likes = Value(likes),
        liked = Value(liked),
        comments = Value(comments);
  static Insertable<MyApartmentTableData> custom({
    Expression<int> id,
    Expression<String> onlineid,
    Expression<String> banner,
    Expression<String> bannertag,
    Expression<String> ownerid,
    Expression<String> ownername,
    Expression<String> ownerlogo,
    Expression<String> description,
    Expression<String> title,
    Expression<String> category,
    Expression<String> emailaddress,
    Expression<String> location,
    Expression<String> address,
    Expression<String> phone,
    Expression<String> video,
    Expression<String> price,
    Expression<String> deposit,
    Expression<String> space,
    Expression<String> latitude,
    Expression<String> longitude,
    Expression<String> rating,
    Expression<String> likes,
    Expression<String> liked,
    Expression<String> comments,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onlineid != null) 'onlineid': onlineid,
      if (banner != null) 'banner': banner,
      if (bannertag != null) 'bannertag': bannertag,
      if (ownerid != null) 'ownerid': ownerid,
      if (ownername != null) 'ownername': ownername,
      if (ownerlogo != null) 'ownerlogo': ownerlogo,
      if (description != null) 'description': description,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (emailaddress != null) 'emailaddress': emailaddress,
      if (location != null) 'location': location,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (video != null) 'video': video,
      if (price != null) 'price': price,
      if (deposit != null) 'deposit': deposit,
      if (space != null) 'space': space,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (rating != null) 'rating': rating,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (comments != null) 'comments': comments,
    });
  }

  MyApartmentTableCompanion copyWith(
      {Value<int> id,
      Value<String> onlineid,
      Value<String> banner,
      Value<String> bannertag,
      Value<String> ownerid,
      Value<String> ownername,
      Value<String> ownerlogo,
      Value<String> description,
      Value<String> title,
      Value<String> category,
      Value<String> emailaddress,
      Value<String> location,
      Value<String> address,
      Value<String> phone,
      Value<String> video,
      Value<String> price,
      Value<String> deposit,
      Value<String> space,
      Value<String> latitude,
      Value<String> longitude,
      Value<String> rating,
      Value<String> likes,
      Value<String> liked,
      Value<String> comments}) {
    return MyApartmentTableCompanion(
      id: id ?? this.id,
      onlineid: onlineid ?? this.onlineid,
      banner: banner ?? this.banner,
      bannertag: bannertag ?? this.bannertag,
      ownerid: ownerid ?? this.ownerid,
      ownername: ownername ?? this.ownername,
      ownerlogo: ownerlogo ?? this.ownerlogo,
      description: description ?? this.description,
      title: title ?? this.title,
      category: category ?? this.category,
      emailaddress: emailaddress ?? this.emailaddress,
      location: location ?? this.location,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      video: video ?? this.video,
      price: price ?? this.price,
      deposit: deposit ?? this.deposit,
      space: space ?? this.space,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      comments: comments ?? this.comments,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String>(banner.value);
    }
    if (bannertag.present) {
      map['bannertag'] = Variable<String>(bannertag.value);
    }
    if (ownerid.present) {
      map['ownerid'] = Variable<String>(ownerid.value);
    }
    if (ownername.present) {
      map['ownername'] = Variable<String>(ownername.value);
    }
    if (ownerlogo.present) {
      map['ownerlogo'] = Variable<String>(ownerlogo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (emailaddress.present) {
      map['emailaddress'] = Variable<String>(emailaddress.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (video.present) {
      map['video'] = Variable<String>(video.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<String>(deposit.value);
    }
    if (space.present) {
      map['space'] = Variable<String>(space.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (likes.present) {
      map['likes'] = Variable<String>(likes.value);
    }
    if (liked.present) {
      map['liked'] = Variable<String>(liked.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyApartmentTableCompanion(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('banner: $banner, ')
          ..write('bannertag: $bannertag, ')
          ..write('ownerid: $ownerid, ')
          ..write('ownername: $ownername, ')
          ..write('ownerlogo: $ownerlogo, ')
          ..write('description: $description, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('emailaddress: $emailaddress, ')
          ..write('location: $location, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('video: $video, ')
          ..write('price: $price, ')
          ..write('deposit: $deposit, ')
          ..write('space: $space, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('rating: $rating, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('comments: $comments')
          ..write(')'))
        .toString();
  }
}

class $MyApartmentTableTable extends MyApartmentTable
    with TableInfo<$MyApartmentTableTable, MyApartmentTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyApartmentTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  GeneratedTextColumn _onlineid;
  @override
  GeneratedTextColumn get onlineid => _onlineid ??= _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  GeneratedTextColumn _banner;
  @override
  GeneratedTextColumn get banner => _banner ??= _constructBanner();
  GeneratedTextColumn _constructBanner() {
    return GeneratedTextColumn(
      'banner',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bannertagMeta = const VerificationMeta('bannertag');
  GeneratedTextColumn _bannertag;
  @override
  GeneratedTextColumn get bannertag => _bannertag ??= _constructBannertag();
  GeneratedTextColumn _constructBannertag() {
    return GeneratedTextColumn(
      'bannertag',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneridMeta = const VerificationMeta('ownerid');
  GeneratedTextColumn _ownerid;
  @override
  GeneratedTextColumn get ownerid => _ownerid ??= _constructOwnerid();
  GeneratedTextColumn _constructOwnerid() {
    return GeneratedTextColumn(
      'ownerid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownernameMeta = const VerificationMeta('ownername');
  GeneratedTextColumn _ownername;
  @override
  GeneratedTextColumn get ownername => _ownername ??= _constructOwnername();
  GeneratedTextColumn _constructOwnername() {
    return GeneratedTextColumn(
      'ownername',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlogoMeta = const VerificationMeta('ownerlogo');
  GeneratedTextColumn _ownerlogo;
  @override
  GeneratedTextColumn get ownerlogo => _ownerlogo ??= _constructOwnerlogo();
  GeneratedTextColumn _constructOwnerlogo() {
    return GeneratedTextColumn(
      'ownerlogo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailaddressMeta =
      const VerificationMeta('emailaddress');
  GeneratedTextColumn _emailaddress;
  @override
  GeneratedTextColumn get emailaddress =>
      _emailaddress ??= _constructEmailaddress();
  GeneratedTextColumn _constructEmailaddress() {
    return GeneratedTextColumn(
      'emailaddress',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      true,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _videoMeta = const VerificationMeta('video');
  GeneratedTextColumn _video;
  @override
  GeneratedTextColumn get video => _video ??= _constructVideo();
  GeneratedTextColumn _constructVideo() {
    return GeneratedTextColumn(
      'video',
      $tableName,
      true,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositMeta = const VerificationMeta('deposit');
  GeneratedTextColumn _deposit;
  @override
  GeneratedTextColumn get deposit => _deposit ??= _constructDeposit();
  GeneratedTextColumn _constructDeposit() {
    return GeneratedTextColumn(
      'deposit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _spaceMeta = const VerificationMeta('space');
  GeneratedTextColumn _space;
  @override
  GeneratedTextColumn get space => _space ??= _constructSpace();
  GeneratedTextColumn _constructSpace() {
    return GeneratedTextColumn(
      'space',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedTextColumn _latitude;
  @override
  GeneratedTextColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedTextColumn _constructLatitude() {
    return GeneratedTextColumn(
      'latitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedTextColumn _longitude;
  @override
  GeneratedTextColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedTextColumn _constructLongitude() {
    return GeneratedTextColumn(
      'longitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedTextColumn _rating;
  @override
  GeneratedTextColumn get rating => _rating ??= _constructRating();
  GeneratedTextColumn _constructRating() {
    return GeneratedTextColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  GeneratedTextColumn _likes;
  @override
  GeneratedTextColumn get likes => _likes ??= _constructLikes();
  GeneratedTextColumn _constructLikes() {
    return GeneratedTextColumn(
      'likes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  GeneratedTextColumn _liked;
  @override
  GeneratedTextColumn get liked => _liked ??= _constructLiked();
  GeneratedTextColumn _constructLiked() {
    return GeneratedTextColumn(
      'liked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  GeneratedTextColumn _comments;
  @override
  GeneratedTextColumn get comments => _comments ??= _constructComments();
  GeneratedTextColumn _constructComments() {
    return GeneratedTextColumn(
      'comments',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        onlineid,
        banner,
        bannertag,
        ownerid,
        ownername,
        ownerlogo,
        description,
        title,
        category,
        emailaddress,
        location,
        address,
        phone,
        video,
        price,
        deposit,
        space,
        latitude,
        longitude,
        rating,
        likes,
        liked,
        comments
      ];
  @override
  $MyApartmentTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_apartment_table';
  @override
  final String actualTableName = 'my_apartment_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MyApartmentTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid'], _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner'], _bannerMeta));
    } else if (isInserting) {
      context.missing(_bannerMeta);
    }
    if (data.containsKey('bannertag')) {
      context.handle(_bannertagMeta,
          bannertag.isAcceptableOrUnknown(data['bannertag'], _bannertagMeta));
    } else if (isInserting) {
      context.missing(_bannertagMeta);
    }
    if (data.containsKey('ownerid')) {
      context.handle(_owneridMeta,
          ownerid.isAcceptableOrUnknown(data['ownerid'], _owneridMeta));
    } else if (isInserting) {
      context.missing(_owneridMeta);
    }
    if (data.containsKey('ownername')) {
      context.handle(_ownernameMeta,
          ownername.isAcceptableOrUnknown(data['ownername'], _ownernameMeta));
    } else if (isInserting) {
      context.missing(_ownernameMeta);
    }
    if (data.containsKey('ownerlogo')) {
      context.handle(_ownerlogoMeta,
          ownerlogo.isAcceptableOrUnknown(data['ownerlogo'], _ownerlogoMeta));
    } else if (isInserting) {
      context.missing(_ownerlogoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('emailaddress')) {
      context.handle(
          _emailaddressMeta,
          emailaddress.isAcceptableOrUnknown(
              data['emailaddress'], _emailaddressMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('video')) {
      context.handle(
          _videoMeta, video.isAcceptableOrUnknown(data['video'], _videoMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit'], _depositMeta));
    } else if (isInserting) {
      context.missing(_depositMeta);
    }
    if (data.containsKey('space')) {
      context.handle(
          _spaceMeta, space.isAcceptableOrUnknown(data['space'], _spaceMeta));
    } else if (isInserting) {
      context.missing(_spaceMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes'], _likesMeta));
    } else if (isInserting) {
      context.missing(_likesMeta);
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked'], _likedMeta));
    } else if (isInserting) {
      context.missing(_likedMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments'], _commentsMeta));
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyApartmentTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyApartmentTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyApartmentTableTable createAlias(String alias) {
    return $MyApartmentTableTable(_db, alias);
  }
}

class MyHouseDetail extends DataClass implements Insertable<MyHouseDetail> {
  final int id;
  final String onlineid;
  final String ownerid;
  final String ownername;
  final String ownerlogo;
  final String owneraddress;
  final String owneremail;
  final String ownerlocation;
  final String ownerphone;
  final String category;
  final String unit;
  final String deposit;
  final String price;
  final String title;
  final String payed;
  final String rating;
  MyHouseDetail(
      {@required this.id,
      @required this.onlineid,
      @required this.ownerid,
      @required this.ownername,
      @required this.ownerlogo,
      @required this.owneraddress,
      @required this.owneremail,
      @required this.ownerlocation,
      @required this.ownerphone,
      @required this.category,
      @required this.unit,
      @required this.deposit,
      @required this.price,
      @required this.title,
      @required this.payed,
      @required this.rating});
  factory MyHouseDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MyHouseDetail(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      onlineid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid']),
      ownerid:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ownerid']),
      ownername: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownername']),
      ownerlogo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlogo']),
      owneraddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}owneraddress']),
      owneremail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}owneremail']),
      ownerlocation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlocation']),
      ownerphone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerphone']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      deposit:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}deposit']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      payed:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}payed']),
      rating:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || onlineid != null) {
      map['onlineid'] = Variable<String>(onlineid);
    }
    if (!nullToAbsent || ownerid != null) {
      map['ownerid'] = Variable<String>(ownerid);
    }
    if (!nullToAbsent || ownername != null) {
      map['ownername'] = Variable<String>(ownername);
    }
    if (!nullToAbsent || ownerlogo != null) {
      map['ownerlogo'] = Variable<String>(ownerlogo);
    }
    if (!nullToAbsent || owneraddress != null) {
      map['owneraddress'] = Variable<String>(owneraddress);
    }
    if (!nullToAbsent || owneremail != null) {
      map['owneremail'] = Variable<String>(owneremail);
    }
    if (!nullToAbsent || ownerlocation != null) {
      map['ownerlocation'] = Variable<String>(ownerlocation);
    }
    if (!nullToAbsent || ownerphone != null) {
      map['ownerphone'] = Variable<String>(ownerphone);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || deposit != null) {
      map['deposit'] = Variable<String>(deposit);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || payed != null) {
      map['payed'] = Variable<String>(payed);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<String>(rating);
    }
    return map;
  }

  MyHouseDetailsCompanion toCompanion(bool nullToAbsent) {
    return MyHouseDetailsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      onlineid: onlineid == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineid),
      ownerid: ownerid == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerid),
      ownername: ownername == null && nullToAbsent
          ? const Value.absent()
          : Value(ownername),
      ownerlogo: ownerlogo == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerlogo),
      owneraddress: owneraddress == null && nullToAbsent
          ? const Value.absent()
          : Value(owneraddress),
      owneremail: owneremail == null && nullToAbsent
          ? const Value.absent()
          : Value(owneremail),
      ownerlocation: ownerlocation == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerlocation),
      ownerphone: ownerphone == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerphone),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      deposit: deposit == null && nullToAbsent
          ? const Value.absent()
          : Value(deposit),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      payed:
          payed == null && nullToAbsent ? const Value.absent() : Value(payed),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
    );
  }

  factory MyHouseDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyHouseDetail(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      ownerid: serializer.fromJson<String>(json['ownerid']),
      ownername: serializer.fromJson<String>(json['ownername']),
      ownerlogo: serializer.fromJson<String>(json['ownerlogo']),
      owneraddress: serializer.fromJson<String>(json['owneraddress']),
      owneremail: serializer.fromJson<String>(json['owneremail']),
      ownerlocation: serializer.fromJson<String>(json['ownerlocation']),
      ownerphone: serializer.fromJson<String>(json['ownerphone']),
      category: serializer.fromJson<String>(json['category']),
      unit: serializer.fromJson<String>(json['unit']),
      deposit: serializer.fromJson<String>(json['deposit']),
      price: serializer.fromJson<String>(json['price']),
      title: serializer.fromJson<String>(json['title']),
      payed: serializer.fromJson<String>(json['payed']),
      rating: serializer.fromJson<String>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'ownerid': serializer.toJson<String>(ownerid),
      'ownername': serializer.toJson<String>(ownername),
      'ownerlogo': serializer.toJson<String>(ownerlogo),
      'owneraddress': serializer.toJson<String>(owneraddress),
      'owneremail': serializer.toJson<String>(owneremail),
      'ownerlocation': serializer.toJson<String>(ownerlocation),
      'ownerphone': serializer.toJson<String>(ownerphone),
      'category': serializer.toJson<String>(category),
      'unit': serializer.toJson<String>(unit),
      'deposit': serializer.toJson<String>(deposit),
      'price': serializer.toJson<String>(price),
      'title': serializer.toJson<String>(title),
      'payed': serializer.toJson<String>(payed),
      'rating': serializer.toJson<String>(rating),
    };
  }

  MyHouseDetail copyWith(
          {int id,
          String onlineid,
          String ownerid,
          String ownername,
          String ownerlogo,
          String owneraddress,
          String owneremail,
          String ownerlocation,
          String ownerphone,
          String category,
          String unit,
          String deposit,
          String price,
          String title,
          String payed,
          String rating}) =>
      MyHouseDetail(
        id: id ?? this.id,
        onlineid: onlineid ?? this.onlineid,
        ownerid: ownerid ?? this.ownerid,
        ownername: ownername ?? this.ownername,
        ownerlogo: ownerlogo ?? this.ownerlogo,
        owneraddress: owneraddress ?? this.owneraddress,
        owneremail: owneremail ?? this.owneremail,
        ownerlocation: ownerlocation ?? this.ownerlocation,
        ownerphone: ownerphone ?? this.ownerphone,
        category: category ?? this.category,
        unit: unit ?? this.unit,
        deposit: deposit ?? this.deposit,
        price: price ?? this.price,
        title: title ?? this.title,
        payed: payed ?? this.payed,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('MyHouseDetail(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('ownerid: $ownerid, ')
          ..write('ownername: $ownername, ')
          ..write('ownerlogo: $ownerlogo, ')
          ..write('owneraddress: $owneraddress, ')
          ..write('owneremail: $owneremail, ')
          ..write('ownerlocation: $ownerlocation, ')
          ..write('ownerphone: $ownerphone, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('deposit: $deposit, ')
          ..write('price: $price, ')
          ..write('title: $title, ')
          ..write('payed: $payed, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          onlineid.hashCode,
          $mrjc(
              ownerid.hashCode,
              $mrjc(
                  ownername.hashCode,
                  $mrjc(
                      ownerlogo.hashCode,
                      $mrjc(
                          owneraddress.hashCode,
                          $mrjc(
                              owneremail.hashCode,
                              $mrjc(
                                  ownerlocation.hashCode,
                                  $mrjc(
                                      ownerphone.hashCode,
                                      $mrjc(
                                          category.hashCode,
                                          $mrjc(
                                              unit.hashCode,
                                              $mrjc(
                                                  deposit.hashCode,
                                                  $mrjc(
                                                      price.hashCode,
                                                      $mrjc(
                                                          title.hashCode,
                                                          $mrjc(
                                                              payed.hashCode,
                                                              rating
                                                                  .hashCode))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyHouseDetail &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.ownerid == this.ownerid &&
          other.ownername == this.ownername &&
          other.ownerlogo == this.ownerlogo &&
          other.owneraddress == this.owneraddress &&
          other.owneremail == this.owneremail &&
          other.ownerlocation == this.ownerlocation &&
          other.ownerphone == this.ownerphone &&
          other.category == this.category &&
          other.unit == this.unit &&
          other.deposit == this.deposit &&
          other.price == this.price &&
          other.title == this.title &&
          other.payed == this.payed &&
          other.rating == this.rating);
}

class MyHouseDetailsCompanion extends UpdateCompanion<MyHouseDetail> {
  final Value<int> id;
  final Value<String> onlineid;
  final Value<String> ownerid;
  final Value<String> ownername;
  final Value<String> ownerlogo;
  final Value<String> owneraddress;
  final Value<String> owneremail;
  final Value<String> ownerlocation;
  final Value<String> ownerphone;
  final Value<String> category;
  final Value<String> unit;
  final Value<String> deposit;
  final Value<String> price;
  final Value<String> title;
  final Value<String> payed;
  final Value<String> rating;
  const MyHouseDetailsCompanion({
    this.id = const Value.absent(),
    this.onlineid = const Value.absent(),
    this.ownerid = const Value.absent(),
    this.ownername = const Value.absent(),
    this.ownerlogo = const Value.absent(),
    this.owneraddress = const Value.absent(),
    this.owneremail = const Value.absent(),
    this.ownerlocation = const Value.absent(),
    this.ownerphone = const Value.absent(),
    this.category = const Value.absent(),
    this.unit = const Value.absent(),
    this.deposit = const Value.absent(),
    this.price = const Value.absent(),
    this.title = const Value.absent(),
    this.payed = const Value.absent(),
    this.rating = const Value.absent(),
  });
  MyHouseDetailsCompanion.insert({
    this.id = const Value.absent(),
    @required String onlineid,
    @required String ownerid,
    @required String ownername,
    @required String ownerlogo,
    @required String owneraddress,
    @required String owneremail,
    @required String ownerlocation,
    @required String ownerphone,
    @required String category,
    @required String unit,
    @required String deposit,
    @required String price,
    @required String title,
    @required String payed,
    @required String rating,
  })  : onlineid = Value(onlineid),
        ownerid = Value(ownerid),
        ownername = Value(ownername),
        ownerlogo = Value(ownerlogo),
        owneraddress = Value(owneraddress),
        owneremail = Value(owneremail),
        ownerlocation = Value(ownerlocation),
        ownerphone = Value(ownerphone),
        category = Value(category),
        unit = Value(unit),
        deposit = Value(deposit),
        price = Value(price),
        title = Value(title),
        payed = Value(payed),
        rating = Value(rating);
  static Insertable<MyHouseDetail> custom({
    Expression<int> id,
    Expression<String> onlineid,
    Expression<String> ownerid,
    Expression<String> ownername,
    Expression<String> ownerlogo,
    Expression<String> owneraddress,
    Expression<String> owneremail,
    Expression<String> ownerlocation,
    Expression<String> ownerphone,
    Expression<String> category,
    Expression<String> unit,
    Expression<String> deposit,
    Expression<String> price,
    Expression<String> title,
    Expression<String> payed,
    Expression<String> rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onlineid != null) 'onlineid': onlineid,
      if (ownerid != null) 'ownerid': ownerid,
      if (ownername != null) 'ownername': ownername,
      if (ownerlogo != null) 'ownerlogo': ownerlogo,
      if (owneraddress != null) 'owneraddress': owneraddress,
      if (owneremail != null) 'owneremail': owneremail,
      if (ownerlocation != null) 'ownerlocation': ownerlocation,
      if (ownerphone != null) 'ownerphone': ownerphone,
      if (category != null) 'category': category,
      if (unit != null) 'unit': unit,
      if (deposit != null) 'deposit': deposit,
      if (price != null) 'price': price,
      if (title != null) 'title': title,
      if (payed != null) 'payed': payed,
      if (rating != null) 'rating': rating,
    });
  }

  MyHouseDetailsCompanion copyWith(
      {Value<int> id,
      Value<String> onlineid,
      Value<String> ownerid,
      Value<String> ownername,
      Value<String> ownerlogo,
      Value<String> owneraddress,
      Value<String> owneremail,
      Value<String> ownerlocation,
      Value<String> ownerphone,
      Value<String> category,
      Value<String> unit,
      Value<String> deposit,
      Value<String> price,
      Value<String> title,
      Value<String> payed,
      Value<String> rating}) {
    return MyHouseDetailsCompanion(
      id: id ?? this.id,
      onlineid: onlineid ?? this.onlineid,
      ownerid: ownerid ?? this.ownerid,
      ownername: ownername ?? this.ownername,
      ownerlogo: ownerlogo ?? this.ownerlogo,
      owneraddress: owneraddress ?? this.owneraddress,
      owneremail: owneremail ?? this.owneremail,
      ownerlocation: ownerlocation ?? this.ownerlocation,
      ownerphone: ownerphone ?? this.ownerphone,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      deposit: deposit ?? this.deposit,
      price: price ?? this.price,
      title: title ?? this.title,
      payed: payed ?? this.payed,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (ownerid.present) {
      map['ownerid'] = Variable<String>(ownerid.value);
    }
    if (ownername.present) {
      map['ownername'] = Variable<String>(ownername.value);
    }
    if (ownerlogo.present) {
      map['ownerlogo'] = Variable<String>(ownerlogo.value);
    }
    if (owneraddress.present) {
      map['owneraddress'] = Variable<String>(owneraddress.value);
    }
    if (owneremail.present) {
      map['owneremail'] = Variable<String>(owneremail.value);
    }
    if (ownerlocation.present) {
      map['ownerlocation'] = Variable<String>(ownerlocation.value);
    }
    if (ownerphone.present) {
      map['ownerphone'] = Variable<String>(ownerphone.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<String>(deposit.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (payed.present) {
      map['payed'] = Variable<String>(payed.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyHouseDetailsCompanion(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('ownerid: $ownerid, ')
          ..write('ownername: $ownername, ')
          ..write('ownerlogo: $ownerlogo, ')
          ..write('owneraddress: $owneraddress, ')
          ..write('owneremail: $owneremail, ')
          ..write('ownerlocation: $ownerlocation, ')
          ..write('ownerphone: $ownerphone, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('deposit: $deposit, ')
          ..write('price: $price, ')
          ..write('title: $title, ')
          ..write('payed: $payed, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $MyHouseDetailsTable extends MyHouseDetails
    with TableInfo<$MyHouseDetailsTable, MyHouseDetail> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyHouseDetailsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  GeneratedTextColumn _onlineid;
  @override
  GeneratedTextColumn get onlineid => _onlineid ??= _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneridMeta = const VerificationMeta('ownerid');
  GeneratedTextColumn _ownerid;
  @override
  GeneratedTextColumn get ownerid => _ownerid ??= _constructOwnerid();
  GeneratedTextColumn _constructOwnerid() {
    return GeneratedTextColumn(
      'ownerid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownernameMeta = const VerificationMeta('ownername');
  GeneratedTextColumn _ownername;
  @override
  GeneratedTextColumn get ownername => _ownername ??= _constructOwnername();
  GeneratedTextColumn _constructOwnername() {
    return GeneratedTextColumn(
      'ownername',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlogoMeta = const VerificationMeta('ownerlogo');
  GeneratedTextColumn _ownerlogo;
  @override
  GeneratedTextColumn get ownerlogo => _ownerlogo ??= _constructOwnerlogo();
  GeneratedTextColumn _constructOwnerlogo() {
    return GeneratedTextColumn(
      'ownerlogo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneraddressMeta =
      const VerificationMeta('owneraddress');
  GeneratedTextColumn _owneraddress;
  @override
  GeneratedTextColumn get owneraddress =>
      _owneraddress ??= _constructOwneraddress();
  GeneratedTextColumn _constructOwneraddress() {
    return GeneratedTextColumn(
      'owneraddress',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneremailMeta = const VerificationMeta('owneremail');
  GeneratedTextColumn _owneremail;
  @override
  GeneratedTextColumn get owneremail => _owneremail ??= _constructOwneremail();
  GeneratedTextColumn _constructOwneremail() {
    return GeneratedTextColumn(
      'owneremail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlocationMeta =
      const VerificationMeta('ownerlocation');
  GeneratedTextColumn _ownerlocation;
  @override
  GeneratedTextColumn get ownerlocation =>
      _ownerlocation ??= _constructOwnerlocation();
  GeneratedTextColumn _constructOwnerlocation() {
    return GeneratedTextColumn(
      'ownerlocation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerphoneMeta = const VerificationMeta('ownerphone');
  GeneratedTextColumn _ownerphone;
  @override
  GeneratedTextColumn get ownerphone => _ownerphone ??= _constructOwnerphone();
  GeneratedTextColumn _constructOwnerphone() {
    return GeneratedTextColumn(
      'ownerphone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedTextColumn _unit;
  @override
  GeneratedTextColumn get unit => _unit ??= _constructUnit();
  GeneratedTextColumn _constructUnit() {
    return GeneratedTextColumn(
      'unit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositMeta = const VerificationMeta('deposit');
  GeneratedTextColumn _deposit;
  @override
  GeneratedTextColumn get deposit => _deposit ??= _constructDeposit();
  GeneratedTextColumn _constructDeposit() {
    return GeneratedTextColumn(
      'deposit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _payedMeta = const VerificationMeta('payed');
  GeneratedTextColumn _payed;
  @override
  GeneratedTextColumn get payed => _payed ??= _constructPayed();
  GeneratedTextColumn _constructPayed() {
    return GeneratedTextColumn(
      'payed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedTextColumn _rating;
  @override
  GeneratedTextColumn get rating => _rating ??= _constructRating();
  GeneratedTextColumn _constructRating() {
    return GeneratedTextColumn(
      'rating',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        onlineid,
        ownerid,
        ownername,
        ownerlogo,
        owneraddress,
        owneremail,
        ownerlocation,
        ownerphone,
        category,
        unit,
        deposit,
        price,
        title,
        payed,
        rating
      ];
  @override
  $MyHouseDetailsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_house_details';
  @override
  final String actualTableName = 'my_house_details';
  @override
  VerificationContext validateIntegrity(Insertable<MyHouseDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid'], _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('ownerid')) {
      context.handle(_owneridMeta,
          ownerid.isAcceptableOrUnknown(data['ownerid'], _owneridMeta));
    } else if (isInserting) {
      context.missing(_owneridMeta);
    }
    if (data.containsKey('ownername')) {
      context.handle(_ownernameMeta,
          ownername.isAcceptableOrUnknown(data['ownername'], _ownernameMeta));
    } else if (isInserting) {
      context.missing(_ownernameMeta);
    }
    if (data.containsKey('ownerlogo')) {
      context.handle(_ownerlogoMeta,
          ownerlogo.isAcceptableOrUnknown(data['ownerlogo'], _ownerlogoMeta));
    } else if (isInserting) {
      context.missing(_ownerlogoMeta);
    }
    if (data.containsKey('owneraddress')) {
      context.handle(
          _owneraddressMeta,
          owneraddress.isAcceptableOrUnknown(
              data['owneraddress'], _owneraddressMeta));
    } else if (isInserting) {
      context.missing(_owneraddressMeta);
    }
    if (data.containsKey('owneremail')) {
      context.handle(
          _owneremailMeta,
          owneremail.isAcceptableOrUnknown(
              data['owneremail'], _owneremailMeta));
    } else if (isInserting) {
      context.missing(_owneremailMeta);
    }
    if (data.containsKey('ownerlocation')) {
      context.handle(
          _ownerlocationMeta,
          ownerlocation.isAcceptableOrUnknown(
              data['ownerlocation'], _ownerlocationMeta));
    } else if (isInserting) {
      context.missing(_ownerlocationMeta);
    }
    if (data.containsKey('ownerphone')) {
      context.handle(
          _ownerphoneMeta,
          ownerphone.isAcceptableOrUnknown(
              data['ownerphone'], _ownerphoneMeta));
    } else if (isInserting) {
      context.missing(_ownerphoneMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit'], _depositMeta));
    } else if (isInserting) {
      context.missing(_depositMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('payed')) {
      context.handle(
          _payedMeta, payed.isAcceptableOrUnknown(data['payed'], _payedMeta));
    } else if (isInserting) {
      context.missing(_payedMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHouseDetail map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyHouseDetail.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyHouseDetailsTable createAlias(String alias) {
    return $MyHouseDetailsTable(_db, alias);
  }
}

class MyHouseArrear extends DataClass implements Insertable<MyHouseArrear> {
  final int id;
  final String onlineid;
  final String amount;
  final String year;
  final String month;
  MyHouseArrear(
      {@required this.id,
      @required this.onlineid,
      @required this.amount,
      @required this.year,
      @required this.month});
  factory MyHouseArrear.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MyHouseArrear(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      onlineid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid']),
      amount:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      year: stringType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
      month:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}month']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || onlineid != null) {
      map['onlineid'] = Variable<String>(onlineid);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String>(amount);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String>(year);
    }
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String>(month);
    }
    return map;
  }

  MyHouseArrearsCompanion toCompanion(bool nullToAbsent) {
    return MyHouseArrearsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      onlineid: onlineid == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineid),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      month:
          month == null && nullToAbsent ? const Value.absent() : Value(month),
    );
  }

  factory MyHouseArrear.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyHouseArrear(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      amount: serializer.fromJson<String>(json['amount']),
      year: serializer.fromJson<String>(json['year']),
      month: serializer.fromJson<String>(json['month']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'amount': serializer.toJson<String>(amount),
      'year': serializer.toJson<String>(year),
      'month': serializer.toJson<String>(month),
    };
  }

  MyHouseArrear copyWith(
          {int id,
          String onlineid,
          String amount,
          String year,
          String month}) =>
      MyHouseArrear(
        id: id ?? this.id,
        onlineid: onlineid ?? this.onlineid,
        amount: amount ?? this.amount,
        year: year ?? this.year,
        month: month ?? this.month,
      );
  @override
  String toString() {
    return (StringBuffer('MyHouseArrear(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('amount: $amount, ')
          ..write('year: $year, ')
          ..write('month: $month')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(onlineid.hashCode,
          $mrjc(amount.hashCode, $mrjc(year.hashCode, month.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyHouseArrear &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.amount == this.amount &&
          other.year == this.year &&
          other.month == this.month);
}

class MyHouseArrearsCompanion extends UpdateCompanion<MyHouseArrear> {
  final Value<int> id;
  final Value<String> onlineid;
  final Value<String> amount;
  final Value<String> year;
  final Value<String> month;
  const MyHouseArrearsCompanion({
    this.id = const Value.absent(),
    this.onlineid = const Value.absent(),
    this.amount = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
  });
  MyHouseArrearsCompanion.insert({
    this.id = const Value.absent(),
    @required String onlineid,
    @required String amount,
    @required String year,
    @required String month,
  })  : onlineid = Value(onlineid),
        amount = Value(amount),
        year = Value(year),
        month = Value(month);
  static Insertable<MyHouseArrear> custom({
    Expression<int> id,
    Expression<String> onlineid,
    Expression<String> amount,
    Expression<String> year,
    Expression<String> month,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onlineid != null) 'onlineid': onlineid,
      if (amount != null) 'amount': amount,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
    });
  }

  MyHouseArrearsCompanion copyWith(
      {Value<int> id,
      Value<String> onlineid,
      Value<String> amount,
      Value<String> year,
      Value<String> month}) {
    return MyHouseArrearsCompanion(
      id: id ?? this.id,
      onlineid: onlineid ?? this.onlineid,
      amount: amount ?? this.amount,
      year: year ?? this.year,
      month: month ?? this.month,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<String>(month.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyHouseArrearsCompanion(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('amount: $amount, ')
          ..write('year: $year, ')
          ..write('month: $month')
          ..write(')'))
        .toString();
  }
}

class $MyHouseArrearsTable extends MyHouseArrears
    with TableInfo<$MyHouseArrearsTable, MyHouseArrear> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyHouseArrearsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  GeneratedTextColumn _onlineid;
  @override
  GeneratedTextColumn get onlineid => _onlineid ??= _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedTextColumn _amount;
  @override
  GeneratedTextColumn get amount => _amount ??= _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedTextColumn _year;
  @override
  GeneratedTextColumn get year => _year ??= _constructYear();
  GeneratedTextColumn _constructYear() {
    return GeneratedTextColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  GeneratedTextColumn _month;
  @override
  GeneratedTextColumn get month => _month ??= _constructMonth();
  GeneratedTextColumn _constructMonth() {
    return GeneratedTextColumn(
      'month',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, onlineid, amount, year, month];
  @override
  $MyHouseArrearsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_house_arrears';
  @override
  final String actualTableName = 'my_house_arrears';
  @override
  VerificationContext validateIntegrity(Insertable<MyHouseArrear> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid'], _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year'], _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month'], _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHouseArrear map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyHouseArrear.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyHouseArrearsTable createAlias(String alias) {
    return $MyHouseArrearsTable(_db, alias);
  }
}

class MyHousePayment extends DataClass implements Insertable<MyHousePayment> {
  final int id;
  final String onlineid;
  final String transactionid;
  final String amount;
  final String status;
  final String time;
  final String year;
  final String month;
  final String type;
  MyHousePayment(
      {@required this.id,
      @required this.onlineid,
      @required this.transactionid,
      @required this.amount,
      @required this.status,
      @required this.time,
      @required this.year,
      @required this.month,
      @required this.type});
  factory MyHousePayment.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MyHousePayment(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      onlineid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid']),
      transactionid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}transactionid']),
      amount:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      time: stringType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
      year: stringType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
      month:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}month']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || onlineid != null) {
      map['onlineid'] = Variable<String>(onlineid);
    }
    if (!nullToAbsent || transactionid != null) {
      map['transactionid'] = Variable<String>(transactionid);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String>(amount);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String>(time);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String>(year);
    }
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<String>(month);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  MyHousePaymentsCompanion toCompanion(bool nullToAbsent) {
    return MyHousePaymentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      onlineid: onlineid == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineid),
      transactionid: transactionid == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionid),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      month:
          month == null && nullToAbsent ? const Value.absent() : Value(month),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory MyHousePayment.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyHousePayment(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      transactionid: serializer.fromJson<String>(json['transactionid']),
      amount: serializer.fromJson<String>(json['amount']),
      status: serializer.fromJson<String>(json['status']),
      time: serializer.fromJson<String>(json['time']),
      year: serializer.fromJson<String>(json['year']),
      month: serializer.fromJson<String>(json['month']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'transactionid': serializer.toJson<String>(transactionid),
      'amount': serializer.toJson<String>(amount),
      'status': serializer.toJson<String>(status),
      'time': serializer.toJson<String>(time),
      'year': serializer.toJson<String>(year),
      'month': serializer.toJson<String>(month),
      'type': serializer.toJson<String>(type),
    };
  }

  MyHousePayment copyWith(
          {int id,
          String onlineid,
          String transactionid,
          String amount,
          String status,
          String time,
          String year,
          String month,
          String type}) =>
      MyHousePayment(
        id: id ?? this.id,
        onlineid: onlineid ?? this.onlineid,
        transactionid: transactionid ?? this.transactionid,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        time: time ?? this.time,
        year: year ?? this.year,
        month: month ?? this.month,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('MyHousePayment(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('transactionid: $transactionid, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          onlineid.hashCode,
          $mrjc(
              transactionid.hashCode,
              $mrjc(
                  amount.hashCode,
                  $mrjc(
                      status.hashCode,
                      $mrjc(
                          time.hashCode,
                          $mrjc(year.hashCode,
                              $mrjc(month.hashCode, type.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyHousePayment &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.transactionid == this.transactionid &&
          other.amount == this.amount &&
          other.status == this.status &&
          other.time == this.time &&
          other.year == this.year &&
          other.month == this.month &&
          other.type == this.type);
}

class MyHousePaymentsCompanion extends UpdateCompanion<MyHousePayment> {
  final Value<int> id;
  final Value<String> onlineid;
  final Value<String> transactionid;
  final Value<String> amount;
  final Value<String> status;
  final Value<String> time;
  final Value<String> year;
  final Value<String> month;
  final Value<String> type;
  const MyHousePaymentsCompanion({
    this.id = const Value.absent(),
    this.onlineid = const Value.absent(),
    this.transactionid = const Value.absent(),
    this.amount = const Value.absent(),
    this.status = const Value.absent(),
    this.time = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.type = const Value.absent(),
  });
  MyHousePaymentsCompanion.insert({
    this.id = const Value.absent(),
    @required String onlineid,
    @required String transactionid,
    @required String amount,
    @required String status,
    @required String time,
    @required String year,
    @required String month,
    @required String type,
  })  : onlineid = Value(onlineid),
        transactionid = Value(transactionid),
        amount = Value(amount),
        status = Value(status),
        time = Value(time),
        year = Value(year),
        month = Value(month),
        type = Value(type);
  static Insertable<MyHousePayment> custom({
    Expression<int> id,
    Expression<String> onlineid,
    Expression<String> transactionid,
    Expression<String> amount,
    Expression<String> status,
    Expression<String> time,
    Expression<String> year,
    Expression<String> month,
    Expression<String> type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onlineid != null) 'onlineid': onlineid,
      if (transactionid != null) 'transactionid': transactionid,
      if (amount != null) 'amount': amount,
      if (status != null) 'status': status,
      if (time != null) 'time': time,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (type != null) 'type': type,
    });
  }

  MyHousePaymentsCompanion copyWith(
      {Value<int> id,
      Value<String> onlineid,
      Value<String> transactionid,
      Value<String> amount,
      Value<String> status,
      Value<String> time,
      Value<String> year,
      Value<String> month,
      Value<String> type}) {
    return MyHousePaymentsCompanion(
      id: id ?? this.id,
      onlineid: onlineid ?? this.onlineid,
      transactionid: transactionid ?? this.transactionid,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      time: time ?? this.time,
      year: year ?? this.year,
      month: month ?? this.month,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (transactionid.present) {
      map['transactionid'] = Variable<String>(transactionid.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<String>(month.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyHousePaymentsCompanion(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('transactionid: $transactionid, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $MyHousePaymentsTable extends MyHousePayments
    with TableInfo<$MyHousePaymentsTable, MyHousePayment> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyHousePaymentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  GeneratedTextColumn _onlineid;
  @override
  GeneratedTextColumn get onlineid => _onlineid ??= _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _transactionidMeta =
      const VerificationMeta('transactionid');
  GeneratedTextColumn _transactionid;
  @override
  GeneratedTextColumn get transactionid =>
      _transactionid ??= _constructTransactionid();
  GeneratedTextColumn _constructTransactionid() {
    return GeneratedTextColumn(
      'transactionid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedTextColumn _amount;
  @override
  GeneratedTextColumn get amount => _amount ??= _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedTextColumn _time;
  @override
  GeneratedTextColumn get time => _time ??= _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn(
      'time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedTextColumn _year;
  @override
  GeneratedTextColumn get year => _year ??= _constructYear();
  GeneratedTextColumn _constructYear() {
    return GeneratedTextColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  GeneratedTextColumn _month;
  @override
  GeneratedTextColumn get month => _month ??= _constructMonth();
  GeneratedTextColumn _constructMonth() {
    return GeneratedTextColumn(
      'month',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, onlineid, transactionid, amount, status, time, year, month, type];
  @override
  $MyHousePaymentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_house_payments';
  @override
  final String actualTableName = 'my_house_payments';
  @override
  VerificationContext validateIntegrity(Insertable<MyHousePayment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid'], _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('transactionid')) {
      context.handle(
          _transactionidMeta,
          transactionid.isAcceptableOrUnknown(
              data['transactionid'], _transactionidMeta));
    } else if (isInserting) {
      context.missing(_transactionidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year'], _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month'], _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHousePayment map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyHousePayment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyHousePaymentsTable createAlias(String alias) {
    return $MyHousePaymentsTable(_db, alias);
  }
}

class Contact extends DataClass implements Insertable<Contact> {
  final int id;
  final String onlineid;
  final String phone;
  final String address;
  final String location;
  final String email;
  final String twitter;
  final String facebook;
  final String instagram;
  Contact(
      {@required this.id,
      @required this.onlineid,
      @required this.phone,
      this.address,
      this.location,
      @required this.email,
      this.twitter,
      this.facebook,
      this.instagram});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Contact(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      onlineid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      twitter:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}twitter']),
      facebook: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}facebook']),
      instagram: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}instagram']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || onlineid != null) {
      map['onlineid'] = Variable<String>(onlineid);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || twitter != null) {
      map['twitter'] = Variable<String>(twitter);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String>(facebook);
    }
    if (!nullToAbsent || instagram != null) {
      map['instagram'] = Variable<String>(instagram);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      onlineid: onlineid == null && nullToAbsent
          ? const Value.absent()
          : Value(onlineid),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      twitter: twitter == null && nullToAbsent
          ? const Value.absent()
          : Value(twitter),
      facebook: facebook == null && nullToAbsent
          ? const Value.absent()
          : Value(facebook),
      instagram: instagram == null && nullToAbsent
          ? const Value.absent()
          : Value(instagram),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String>(json['address']),
      location: serializer.fromJson<String>(json['location']),
      email: serializer.fromJson<String>(json['email']),
      twitter: serializer.fromJson<String>(json['twitter']),
      facebook: serializer.fromJson<String>(json['facebook']),
      instagram: serializer.fromJson<String>(json['instagram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String>(address),
      'location': serializer.toJson<String>(location),
      'email': serializer.toJson<String>(email),
      'twitter': serializer.toJson<String>(twitter),
      'facebook': serializer.toJson<String>(facebook),
      'instagram': serializer.toJson<String>(instagram),
    };
  }

  Contact copyWith(
          {int id,
          String onlineid,
          String phone,
          String address,
          String location,
          String email,
          String twitter,
          String facebook,
          String instagram}) =>
      Contact(
        id: id ?? this.id,
        onlineid: onlineid ?? this.onlineid,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        location: location ?? this.location,
        email: email ?? this.email,
        twitter: twitter ?? this.twitter,
        facebook: facebook ?? this.facebook,
        instagram: instagram ?? this.instagram,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('location: $location, ')
          ..write('email: $email, ')
          ..write('twitter: $twitter, ')
          ..write('facebook: $facebook, ')
          ..write('instagram: $instagram')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          onlineid.hashCode,
          $mrjc(
              phone.hashCode,
              $mrjc(
                  address.hashCode,
                  $mrjc(
                      location.hashCode,
                      $mrjc(
                          email.hashCode,
                          $mrjc(
                              twitter.hashCode,
                              $mrjc(facebook.hashCode,
                                  instagram.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.location == this.location &&
          other.email == this.email &&
          other.twitter == this.twitter &&
          other.facebook == this.facebook &&
          other.instagram == this.instagram);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<int> id;
  final Value<String> onlineid;
  final Value<String> phone;
  final Value<String> address;
  final Value<String> location;
  final Value<String> email;
  final Value<String> twitter;
  final Value<String> facebook;
  final Value<String> instagram;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.onlineid = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.location = const Value.absent(),
    this.email = const Value.absent(),
    this.twitter = const Value.absent(),
    this.facebook = const Value.absent(),
    this.instagram = const Value.absent(),
  });
  ContactsCompanion.insert({
    this.id = const Value.absent(),
    @required String onlineid,
    @required String phone,
    this.address = const Value.absent(),
    this.location = const Value.absent(),
    @required String email,
    this.twitter = const Value.absent(),
    this.facebook = const Value.absent(),
    this.instagram = const Value.absent(),
  })  : onlineid = Value(onlineid),
        phone = Value(phone),
        email = Value(email);
  static Insertable<Contact> custom({
    Expression<int> id,
    Expression<String> onlineid,
    Expression<String> phone,
    Expression<String> address,
    Expression<String> location,
    Expression<String> email,
    Expression<String> twitter,
    Expression<String> facebook,
    Expression<String> instagram,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onlineid != null) 'onlineid': onlineid,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (location != null) 'location': location,
      if (email != null) 'email': email,
      if (twitter != null) 'twitter': twitter,
      if (facebook != null) 'facebook': facebook,
      if (instagram != null) 'instagram': instagram,
    });
  }

  ContactsCompanion copyWith(
      {Value<int> id,
      Value<String> onlineid,
      Value<String> phone,
      Value<String> address,
      Value<String> location,
      Value<String> email,
      Value<String> twitter,
      Value<String> facebook,
      Value<String> instagram}) {
    return ContactsCompanion(
      id: id ?? this.id,
      onlineid: onlineid ?? this.onlineid,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      location: location ?? this.location,
      email: email ?? this.email,
      twitter: twitter ?? this.twitter,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (twitter.present) {
      map['twitter'] = Variable<String>(twitter.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String>(facebook.value);
    }
    if (instagram.present) {
      map['instagram'] = Variable<String>(instagram.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('onlineid: $onlineid, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('location: $location, ')
          ..write('email: $email, ')
          ..write('twitter: $twitter, ')
          ..write('facebook: $facebook, ')
          ..write('instagram: $instagram')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  GeneratedTextColumn _onlineid;
  @override
  GeneratedTextColumn get onlineid => _onlineid ??= _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _twitterMeta = const VerificationMeta('twitter');
  GeneratedTextColumn _twitter;
  @override
  GeneratedTextColumn get twitter => _twitter ??= _constructTwitter();
  GeneratedTextColumn _constructTwitter() {
    return GeneratedTextColumn(
      'twitter',
      $tableName,
      true,
    );
  }

  final VerificationMeta _facebookMeta = const VerificationMeta('facebook');
  GeneratedTextColumn _facebook;
  @override
  GeneratedTextColumn get facebook => _facebook ??= _constructFacebook();
  GeneratedTextColumn _constructFacebook() {
    return GeneratedTextColumn(
      'facebook',
      $tableName,
      true,
    );
  }

  final VerificationMeta _instagramMeta = const VerificationMeta('instagram');
  GeneratedTextColumn _instagram;
  @override
  GeneratedTextColumn get instagram => _instagram ??= _constructInstagram();
  GeneratedTextColumn _constructInstagram() {
    return GeneratedTextColumn(
      'instagram',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        onlineid,
        phone,
        address,
        location,
        email,
        twitter,
        facebook,
        instagram
      ];
  @override
  $ContactsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts';
  @override
  final String actualTableName = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid'], _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('twitter')) {
      context.handle(_twitterMeta,
          twitter.isAcceptableOrUnknown(data['twitter'], _twitterMeta));
    }
    if (data.containsKey('facebook')) {
      context.handle(_facebookMeta,
          facebook.isAcceptableOrUnknown(data['facebook'], _facebookMeta));
    }
    if (data.containsKey('instagram')) {
      context.handle(_instagramMeta,
          instagram.isAcceptableOrUnknown(data['instagram'], _instagramMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contact.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(_db, alias);
  }
}

class OfflineActivityData extends DataClass
    implements Insertable<OfflineActivityData> {
  final int id;
  final String userId;
  final String apartmentId;
  final bool like;
  final bool dislike;
  final String comment;
  OfflineActivityData(
      {@required this.id,
      @required this.userId,
      this.apartmentId,
      this.like,
      this.dislike,
      this.comment});
  factory OfflineActivityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return OfflineActivityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      apartmentId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}apartment_id']),
      like: boolType.mapFromDatabaseResponse(data['${effectivePrefix}like']),
      dislike:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}dislike']),
      comment:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}comment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || apartmentId != null) {
      map['apartment_id'] = Variable<String>(apartmentId);
    }
    if (!nullToAbsent || like != null) {
      map['like'] = Variable<bool>(like);
    }
    if (!nullToAbsent || dislike != null) {
      map['dislike'] = Variable<bool>(dislike);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  OfflineActivityCompanion toCompanion(bool nullToAbsent) {
    return OfflineActivityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      apartmentId: apartmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(apartmentId),
      like: like == null && nullToAbsent ? const Value.absent() : Value(like),
      dislike: dislike == null && nullToAbsent
          ? const Value.absent()
          : Value(dislike),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory OfflineActivityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflineActivityData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      apartmentId: serializer.fromJson<String>(json['apartmentId']),
      like: serializer.fromJson<bool>(json['like']),
      dislike: serializer.fromJson<bool>(json['dislike']),
      comment: serializer.fromJson<String>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'apartmentId': serializer.toJson<String>(apartmentId),
      'like': serializer.toJson<bool>(like),
      'dislike': serializer.toJson<bool>(dislike),
      'comment': serializer.toJson<String>(comment),
    };
  }

  OfflineActivityData copyWith(
          {int id,
          String userId,
          String apartmentId,
          bool like,
          bool dislike,
          String comment}) =>
      OfflineActivityData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        apartmentId: apartmentId ?? this.apartmentId,
        like: like ?? this.like,
        dislike: dislike ?? this.dislike,
        comment: comment ?? this.comment,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineActivityData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('apartmentId: $apartmentId, ')
          ..write('like: $like, ')
          ..write('dislike: $dislike, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              apartmentId.hashCode,
              $mrjc(
                  like.hashCode, $mrjc(dislike.hashCode, comment.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OfflineActivityData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.apartmentId == this.apartmentId &&
          other.like == this.like &&
          other.dislike == this.dislike &&
          other.comment == this.comment);
}

class OfflineActivityCompanion extends UpdateCompanion<OfflineActivityData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> apartmentId;
  final Value<bool> like;
  final Value<bool> dislike;
  final Value<String> comment;
  const OfflineActivityCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.apartmentId = const Value.absent(),
    this.like = const Value.absent(),
    this.dislike = const Value.absent(),
    this.comment = const Value.absent(),
  });
  OfflineActivityCompanion.insert({
    this.id = const Value.absent(),
    @required String userId,
    this.apartmentId = const Value.absent(),
    this.like = const Value.absent(),
    this.dislike = const Value.absent(),
    this.comment = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<OfflineActivityData> custom({
    Expression<int> id,
    Expression<String> userId,
    Expression<String> apartmentId,
    Expression<bool> like,
    Expression<bool> dislike,
    Expression<String> comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (apartmentId != null) 'apartment_id': apartmentId,
      if (like != null) 'like': like,
      if (dislike != null) 'dislike': dislike,
      if (comment != null) 'comment': comment,
    });
  }

  OfflineActivityCompanion copyWith(
      {Value<int> id,
      Value<String> userId,
      Value<String> apartmentId,
      Value<bool> like,
      Value<bool> dislike,
      Value<String> comment}) {
    return OfflineActivityCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      apartmentId: apartmentId ?? this.apartmentId,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (apartmentId.present) {
      map['apartment_id'] = Variable<String>(apartmentId.value);
    }
    if (like.present) {
      map['like'] = Variable<bool>(like.value);
    }
    if (dislike.present) {
      map['dislike'] = Variable<bool>(dislike.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineActivityCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('apartmentId: $apartmentId, ')
          ..write('like: $like, ')
          ..write('dislike: $dislike, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $OfflineActivityTable extends OfflineActivity
    with TableInfo<$OfflineActivityTable, OfflineActivityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $OfflineActivityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _apartmentIdMeta =
      const VerificationMeta('apartmentId');
  GeneratedTextColumn _apartmentId;
  @override
  GeneratedTextColumn get apartmentId =>
      _apartmentId ??= _constructApartmentId();
  GeneratedTextColumn _constructApartmentId() {
    return GeneratedTextColumn(
      'apartment_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _likeMeta = const VerificationMeta('like');
  GeneratedBoolColumn _like;
  @override
  GeneratedBoolColumn get like => _like ??= _constructLike();
  GeneratedBoolColumn _constructLike() {
    return GeneratedBoolColumn(
      'like',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dislikeMeta = const VerificationMeta('dislike');
  GeneratedBoolColumn _dislike;
  @override
  GeneratedBoolColumn get dislike => _dislike ??= _constructDislike();
  GeneratedBoolColumn _constructDislike() {
    return GeneratedBoolColumn(
      'dislike',
      $tableName,
      true,
    );
  }

  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  GeneratedTextColumn _comment;
  @override
  GeneratedTextColumn get comment => _comment ??= _constructComment();
  GeneratedTextColumn _constructComment() {
    return GeneratedTextColumn(
      'comment',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, apartmentId, like, dislike, comment];
  @override
  $OfflineActivityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'offline_activity';
  @override
  final String actualTableName = 'offline_activity';
  @override
  VerificationContext validateIntegrity(
      Insertable<OfflineActivityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('apartment_id')) {
      context.handle(
          _apartmentIdMeta,
          apartmentId.isAcceptableOrUnknown(
              data['apartment_id'], _apartmentIdMeta));
    }
    if (data.containsKey('like')) {
      context.handle(
          _likeMeta, like.isAcceptableOrUnknown(data['like'], _likeMeta));
    }
    if (data.containsKey('dislike')) {
      context.handle(_dislikeMeta,
          dislike.isAcceptableOrUnknown(data['dislike'], _dislikeMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment'], _commentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflineActivityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OfflineActivityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OfflineActivityTable createAlias(String alias) {
    return $OfflineActivityTable(_db, alias);
  }
}

abstract class _$DatabaseHelper extends GeneratedDatabase {
  _$DatabaseHelper(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MyApartmentTableTable _myApartmentTable;
  $MyApartmentTableTable get myApartmentTable =>
      _myApartmentTable ??= $MyApartmentTableTable(this);
  $MyHouseDetailsTable _myHouseDetails;
  $MyHouseDetailsTable get myHouseDetails =>
      _myHouseDetails ??= $MyHouseDetailsTable(this);
  $MyHouseArrearsTable _myHouseArrears;
  $MyHouseArrearsTable get myHouseArrears =>
      _myHouseArrears ??= $MyHouseArrearsTable(this);
  $MyHousePaymentsTable _myHousePayments;
  $MyHousePaymentsTable get myHousePayments =>
      _myHousePayments ??= $MyHousePaymentsTable(this);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  $OfflineActivityTable _offlineActivity;
  $OfflineActivityTable get offlineActivity =>
      _offlineActivity ??= $OfflineActivityTable(this);
  DatabaseDao _databaseDao;
  DatabaseDao get databaseDao =>
      _databaseDao ??= DatabaseDao(this as DatabaseHelper);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        myApartmentTable,
        myHouseDetails,
        myHouseArrears,
        myHousePayments,
        contacts,
        offlineActivity
      ];
}
