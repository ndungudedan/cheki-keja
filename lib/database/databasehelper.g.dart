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
  final String description;
  final String title;
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
      this.description,
      @required this.title,
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
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
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
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
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
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
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
      description: serializer.fromJson<String>(json['description']),
      title: serializer.fromJson<String>(json['title']),
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
      'description': serializer.toJson<String>(description),
      'title': serializer.toJson<String>(title),
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
          String description,
          String title,
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
        description: description ?? this.description,
        title: title ?? this.title,
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
          ..write('description: $description, ')
          ..write('title: $title, ')
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
                          description.hashCode,
                          $mrjc(
                              title.hashCode,
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
                                                      price.hashCode,
                                                      $mrjc(
                                                          deposit.hashCode,
                                                          $mrjc(
                                                              space.hashCode,
                                                              $mrjc(
                                                                  latitude
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      longitude
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          rating
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              likes.hashCode,
                                                                              $mrjc(liked.hashCode, comments.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyApartmentTableData &&
          other.id == this.id &&
          other.onlineid == this.onlineid &&
          other.banner == this.banner &&
          other.bannertag == this.bannertag &&
          other.ownerid == this.ownerid &&
          other.description == this.description &&
          other.title == this.title &&
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
  final Value<String> description;
  final Value<String> title;
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
    this.description = const Value.absent(),
    this.title = const Value.absent(),
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
    this.description = const Value.absent(),
    @required String title,
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
        title = Value(title),
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
    Expression<String> description,
    Expression<String> title,
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
      if (description != null) 'description': description,
      if (title != null) 'title': title,
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
      Value<String> description,
      Value<String> title,
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
      description: description ?? this.description,
      title: title ?? this.title,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('description: $description, ')
          ..write('title: $title, ')
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
        description,
        title,
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

abstract class _$DatabaseHelper extends GeneratedDatabase {
  _$DatabaseHelper(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MyApartmentTableTable _myApartmentTable;
  $MyApartmentTableTable get myApartmentTable =>
      _myApartmentTable ??= $MyApartmentTableTable(this);
  DatabaseDao _databaseDao;
  DatabaseDao get databaseDao =>
      _databaseDao ??= DatabaseDao(this as DatabaseHelper);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myApartmentTable];
}
