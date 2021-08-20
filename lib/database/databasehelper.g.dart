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
  final String? description;
  final String title;
  final String? emailaddress;
  final String? location;
  final String? address;
  final String? phone;
  final String? video;
  final String space;
  final String latitude;
  final String longitude;
  final bool vacant;
  final String rating;
  final String likes;
  final String liked;
  final String comments;
  MyApartmentTableData(
      {required this.id,
      required this.onlineid,
      required this.banner,
      required this.bannertag,
      required this.ownerid,
      required this.ownername,
      required this.ownerlogo,
      this.description,
      required this.title,
      this.emailaddress,
      this.location,
      this.address,
      this.phone,
      this.video,
      required this.space,
      required this.latitude,
      required this.longitude,
      required this.vacant,
      required this.rating,
      required this.likes,
      required this.liked,
      required this.comments});
  factory MyApartmentTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyApartmentTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      banner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banner'])!,
      bannertag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bannertag'])!,
      ownerid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerid'])!,
      ownername: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownername'])!,
      ownerlogo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlogo'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      emailaddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emailaddress']),
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      video: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video']),
      space: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}space'])!,
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
      vacant: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vacant'])!,
      rating: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      likes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      comments: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comments'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onlineid'] = Variable<String>(onlineid);
    map['banner'] = Variable<String>(banner);
    map['bannertag'] = Variable<String>(bannertag);
    map['ownerid'] = Variable<String>(ownerid);
    map['ownername'] = Variable<String>(ownername);
    map['ownerlogo'] = Variable<String>(ownerlogo);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || emailaddress != null) {
      map['emailaddress'] = Variable<String?>(emailaddress);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String?>(location);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || video != null) {
      map['video'] = Variable<String?>(video);
    }
    map['space'] = Variable<String>(space);
    map['latitude'] = Variable<String>(latitude);
    map['longitude'] = Variable<String>(longitude);
    map['vacant'] = Variable<bool>(vacant);
    map['rating'] = Variable<String>(rating);
    map['likes'] = Variable<String>(likes);
    map['liked'] = Variable<String>(liked);
    map['comments'] = Variable<String>(comments);
    return map;
  }

  MyApartmentTableCompanion toCompanion(bool nullToAbsent) {
    return MyApartmentTableCompanion(
      id: Value(id),
      onlineid: Value(onlineid),
      banner: Value(banner),
      bannertag: Value(bannertag),
      ownerid: Value(ownerid),
      ownername: Value(ownername),
      ownerlogo: Value(ownerlogo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      title: Value(title),
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
      space: Value(space),
      latitude: Value(latitude),
      longitude: Value(longitude),
      vacant: Value(vacant),
      rating: Value(rating),
      likes: Value(likes),
      liked: Value(liked),
      comments: Value(comments),
    );
  }

  factory MyApartmentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyApartmentTableData(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      banner: serializer.fromJson<String>(json['banner']),
      bannertag: serializer.fromJson<String>(json['bannertag']),
      ownerid: serializer.fromJson<String>(json['ownerid']),
      ownername: serializer.fromJson<String>(json['ownername']),
      ownerlogo: serializer.fromJson<String>(json['ownerlogo']),
      description: serializer.fromJson<String?>(json['description']),
      title: serializer.fromJson<String>(json['title']),
      emailaddress: serializer.fromJson<String?>(json['emailaddress']),
      location: serializer.fromJson<String?>(json['location']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      video: serializer.fromJson<String?>(json['video']),
      space: serializer.fromJson<String>(json['space']),
      latitude: serializer.fromJson<String>(json['latitude']),
      longitude: serializer.fromJson<String>(json['longitude']),
      vacant: serializer.fromJson<bool>(json['vacant']),
      rating: serializer.fromJson<String>(json['rating']),
      likes: serializer.fromJson<String>(json['likes']),
      liked: serializer.fromJson<String>(json['liked']),
      comments: serializer.fromJson<String>(json['comments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'banner': serializer.toJson<String>(banner),
      'bannertag': serializer.toJson<String>(bannertag),
      'ownerid': serializer.toJson<String>(ownerid),
      'ownername': serializer.toJson<String>(ownername),
      'ownerlogo': serializer.toJson<String>(ownerlogo),
      'description': serializer.toJson<String?>(description),
      'title': serializer.toJson<String>(title),
      'emailaddress': serializer.toJson<String?>(emailaddress),
      'location': serializer.toJson<String?>(location),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'video': serializer.toJson<String?>(video),
      'space': serializer.toJson<String>(space),
      'latitude': serializer.toJson<String>(latitude),
      'longitude': serializer.toJson<String>(longitude),
      'vacant': serializer.toJson<bool>(vacant),
      'rating': serializer.toJson<String>(rating),
      'likes': serializer.toJson<String>(likes),
      'liked': serializer.toJson<String>(liked),
      'comments': serializer.toJson<String>(comments),
    };
  }

  MyApartmentTableData copyWith(
          {int? id,
          String? onlineid,
          String? banner,
          String? bannertag,
          String? ownerid,
          String? ownername,
          String? ownerlogo,
          String? description,
          String? title,
          String? emailaddress,
          String? location,
          String? address,
          String? phone,
          String? video,
          String? space,
          String? latitude,
          String? longitude,
          bool? vacant,
          String? rating,
          String? likes,
          String? liked,
          String? comments}) =>
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
        emailaddress: emailaddress ?? this.emailaddress,
        location: location ?? this.location,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        video: video ?? this.video,
        space: space ?? this.space,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        vacant: vacant ?? this.vacant,
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
          ..write('emailaddress: $emailaddress, ')
          ..write('location: $location, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('video: $video, ')
          ..write('space: $space, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('vacant: $vacant, ')
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
                                                              space.hashCode,
                                                              $mrjc(
                                                                  latitude
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      longitude
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          vacant
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              rating.hashCode,
                                                                              $mrjc(likes.hashCode, $mrjc(liked.hashCode, comments.hashCode))))))))))))))))))))));
  @override
  bool operator ==(Object other) =>
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
          other.emailaddress == this.emailaddress &&
          other.location == this.location &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.video == this.video &&
          other.space == this.space &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.vacant == this.vacant &&
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
  final Value<String?> description;
  final Value<String> title;
  final Value<String?> emailaddress;
  final Value<String?> location;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> video;
  final Value<String> space;
  final Value<String> latitude;
  final Value<String> longitude;
  final Value<bool> vacant;
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
    this.emailaddress = const Value.absent(),
    this.location = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.video = const Value.absent(),
    this.space = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.vacant = const Value.absent(),
    this.rating = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.comments = const Value.absent(),
  });
  MyApartmentTableCompanion.insert({
    this.id = const Value.absent(),
    required String onlineid,
    required String banner,
    required String bannertag,
    required String ownerid,
    required String ownername,
    required String ownerlogo,
    this.description = const Value.absent(),
    required String title,
    this.emailaddress = const Value.absent(),
    this.location = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.video = const Value.absent(),
    required String space,
    required String latitude,
    required String longitude,
    required bool vacant,
    required String rating,
    required String likes,
    required String liked,
    required String comments,
  })  : onlineid = Value(onlineid),
        banner = Value(banner),
        bannertag = Value(bannertag),
        ownerid = Value(ownerid),
        ownername = Value(ownername),
        ownerlogo = Value(ownerlogo),
        title = Value(title),
        space = Value(space),
        latitude = Value(latitude),
        longitude = Value(longitude),
        vacant = Value(vacant),
        rating = Value(rating),
        likes = Value(likes),
        liked = Value(liked),
        comments = Value(comments);
  static Insertable<MyApartmentTableData> custom({
    Expression<int>? id,
    Expression<String>? onlineid,
    Expression<String>? banner,
    Expression<String>? bannertag,
    Expression<String>? ownerid,
    Expression<String>? ownername,
    Expression<String>? ownerlogo,
    Expression<String?>? description,
    Expression<String>? title,
    Expression<String?>? emailaddress,
    Expression<String?>? location,
    Expression<String?>? address,
    Expression<String?>? phone,
    Expression<String?>? video,
    Expression<String>? space,
    Expression<String>? latitude,
    Expression<String>? longitude,
    Expression<bool>? vacant,
    Expression<String>? rating,
    Expression<String>? likes,
    Expression<String>? liked,
    Expression<String>? comments,
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
      if (emailaddress != null) 'emailaddress': emailaddress,
      if (location != null) 'location': location,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (video != null) 'video': video,
      if (space != null) 'space': space,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (vacant != null) 'vacant': vacant,
      if (rating != null) 'rating': rating,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (comments != null) 'comments': comments,
    });
  }

  MyApartmentTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? onlineid,
      Value<String>? banner,
      Value<String>? bannertag,
      Value<String>? ownerid,
      Value<String>? ownername,
      Value<String>? ownerlogo,
      Value<String?>? description,
      Value<String>? title,
      Value<String?>? emailaddress,
      Value<String?>? location,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? video,
      Value<String>? space,
      Value<String>? latitude,
      Value<String>? longitude,
      Value<bool>? vacant,
      Value<String>? rating,
      Value<String>? likes,
      Value<String>? liked,
      Value<String>? comments}) {
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
      emailaddress: emailaddress ?? this.emailaddress,
      location: location ?? this.location,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      video: video ?? this.video,
      space: space ?? this.space,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      vacant: vacant ?? this.vacant,
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
      map['description'] = Variable<String?>(description.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (emailaddress.present) {
      map['emailaddress'] = Variable<String?>(emailaddress.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (video.present) {
      map['video'] = Variable<String?>(video.value);
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
    if (vacant.present) {
      map['vacant'] = Variable<bool>(vacant.value);
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
          ..write('emailaddress: $emailaddress, ')
          ..write('location: $location, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('video: $video, ')
          ..write('space: $space, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('vacant: $vacant, ')
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
  final String? _alias;
  $MyApartmentTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  @override
  late final GeneratedTextColumn banner = _constructBanner();
  GeneratedTextColumn _constructBanner() {
    return GeneratedTextColumn(
      'banner',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bannertagMeta = const VerificationMeta('bannertag');
  @override
  late final GeneratedTextColumn bannertag = _constructBannertag();
  GeneratedTextColumn _constructBannertag() {
    return GeneratedTextColumn(
      'bannertag',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneridMeta = const VerificationMeta('ownerid');
  @override
  late final GeneratedTextColumn ownerid = _constructOwnerid();
  GeneratedTextColumn _constructOwnerid() {
    return GeneratedTextColumn(
      'ownerid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownernameMeta = const VerificationMeta('ownername');
  @override
  late final GeneratedTextColumn ownername = _constructOwnername();
  GeneratedTextColumn _constructOwnername() {
    return GeneratedTextColumn(
      'ownername',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlogoMeta = const VerificationMeta('ownerlogo');
  @override
  late final GeneratedTextColumn ownerlogo = _constructOwnerlogo();
  GeneratedTextColumn _constructOwnerlogo() {
    return GeneratedTextColumn(
      'ownerlogo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedTextColumn description = _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailaddressMeta =
      const VerificationMeta('emailaddress');
  @override
  late final GeneratedTextColumn emailaddress = _constructEmailaddress();
  GeneratedTextColumn _constructEmailaddress() {
    return GeneratedTextColumn(
      'emailaddress',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedTextColumn location = _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      true,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedTextColumn address = _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedTextColumn phone = _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedTextColumn video = _constructVideo();
  GeneratedTextColumn _constructVideo() {
    return GeneratedTextColumn(
      'video',
      $tableName,
      true,
    );
  }

  final VerificationMeta _spaceMeta = const VerificationMeta('space');
  @override
  late final GeneratedTextColumn space = _constructSpace();
  GeneratedTextColumn _constructSpace() {
    return GeneratedTextColumn(
      'space',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedTextColumn latitude = _constructLatitude();
  GeneratedTextColumn _constructLatitude() {
    return GeneratedTextColumn(
      'latitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedTextColumn longitude = _constructLongitude();
  GeneratedTextColumn _constructLongitude() {
    return GeneratedTextColumn(
      'longitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _vacantMeta = const VerificationMeta('vacant');
  @override
  late final GeneratedBoolColumn vacant = _constructVacant();
  GeneratedBoolColumn _constructVacant() {
    return GeneratedBoolColumn(
      'vacant',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedTextColumn rating = _constructRating();
  GeneratedTextColumn _constructRating() {
    return GeneratedTextColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedTextColumn likes = _constructLikes();
  GeneratedTextColumn _constructLikes() {
    return GeneratedTextColumn(
      'likes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedTextColumn liked = _constructLiked();
  GeneratedTextColumn _constructLiked() {
    return GeneratedTextColumn(
      'liked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  @override
  late final GeneratedTextColumn comments = _constructComments();
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
        emailaddress,
        location,
        address,
        phone,
        video,
        space,
        latitude,
        longitude,
        vacant,
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    } else if (isInserting) {
      context.missing(_bannerMeta);
    }
    if (data.containsKey('bannertag')) {
      context.handle(_bannertagMeta,
          bannertag.isAcceptableOrUnknown(data['bannertag']!, _bannertagMeta));
    } else if (isInserting) {
      context.missing(_bannertagMeta);
    }
    if (data.containsKey('ownerid')) {
      context.handle(_owneridMeta,
          ownerid.isAcceptableOrUnknown(data['ownerid']!, _owneridMeta));
    } else if (isInserting) {
      context.missing(_owneridMeta);
    }
    if (data.containsKey('ownername')) {
      context.handle(_ownernameMeta,
          ownername.isAcceptableOrUnknown(data['ownername']!, _ownernameMeta));
    } else if (isInserting) {
      context.missing(_ownernameMeta);
    }
    if (data.containsKey('ownerlogo')) {
      context.handle(_ownerlogoMeta,
          ownerlogo.isAcceptableOrUnknown(data['ownerlogo']!, _ownerlogoMeta));
    } else if (isInserting) {
      context.missing(_ownerlogoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('emailaddress')) {
      context.handle(
          _emailaddressMeta,
          emailaddress.isAcceptableOrUnknown(
              data['emailaddress']!, _emailaddressMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('video')) {
      context.handle(
          _videoMeta, video.isAcceptableOrUnknown(data['video']!, _videoMeta));
    }
    if (data.containsKey('space')) {
      context.handle(
          _spaceMeta, space.isAcceptableOrUnknown(data['space']!, _spaceMeta));
    } else if (isInserting) {
      context.missing(_spaceMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('vacant')) {
      context.handle(_vacantMeta,
          vacant.isAcceptableOrUnknown(data['vacant']!, _vacantMeta));
    } else if (isInserting) {
      context.missing(_vacantMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    } else if (isInserting) {
      context.missing(_likesMeta);
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    } else if (isInserting) {
      context.missing(_likedMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta));
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyApartmentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyApartmentTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
      {required this.id,
      required this.onlineid,
      required this.ownerid,
      required this.ownername,
      required this.ownerlogo,
      required this.owneraddress,
      required this.owneremail,
      required this.ownerlocation,
      required this.ownerphone,
      required this.category,
      required this.unit,
      required this.deposit,
      required this.price,
      required this.title,
      required this.payed,
      required this.rating});
  factory MyHouseDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyHouseDetail(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      ownerid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerid'])!,
      ownername: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownername'])!,
      ownerlogo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlogo'])!,
      owneraddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owneraddress'])!,
      owneremail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owneremail'])!,
      ownerlocation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerlocation'])!,
      ownerphone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ownerphone'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      unit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit'])!,
      deposit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit'])!,
      price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      payed: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payed'])!,
      rating: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onlineid'] = Variable<String>(onlineid);
    map['ownerid'] = Variable<String>(ownerid);
    map['ownername'] = Variable<String>(ownername);
    map['ownerlogo'] = Variable<String>(ownerlogo);
    map['owneraddress'] = Variable<String>(owneraddress);
    map['owneremail'] = Variable<String>(owneremail);
    map['ownerlocation'] = Variable<String>(ownerlocation);
    map['ownerphone'] = Variable<String>(ownerphone);
    map['category'] = Variable<String>(category);
    map['unit'] = Variable<String>(unit);
    map['deposit'] = Variable<String>(deposit);
    map['price'] = Variable<String>(price);
    map['title'] = Variable<String>(title);
    map['payed'] = Variable<String>(payed);
    map['rating'] = Variable<String>(rating);
    return map;
  }

  MyHouseDetailsCompanion toCompanion(bool nullToAbsent) {
    return MyHouseDetailsCompanion(
      id: Value(id),
      onlineid: Value(onlineid),
      ownerid: Value(ownerid),
      ownername: Value(ownername),
      ownerlogo: Value(ownerlogo),
      owneraddress: Value(owneraddress),
      owneremail: Value(owneremail),
      ownerlocation: Value(ownerlocation),
      ownerphone: Value(ownerphone),
      category: Value(category),
      unit: Value(unit),
      deposit: Value(deposit),
      price: Value(price),
      title: Value(title),
      payed: Value(payed),
      rating: Value(rating),
    );
  }

  factory MyHouseDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
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
          {int? id,
          String? onlineid,
          String? ownerid,
          String? ownername,
          String? ownerlogo,
          String? owneraddress,
          String? owneremail,
          String? ownerlocation,
          String? ownerphone,
          String? category,
          String? unit,
          String? deposit,
          String? price,
          String? title,
          String? payed,
          String? rating}) =>
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
  bool operator ==(Object other) =>
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
    required String onlineid,
    required String ownerid,
    required String ownername,
    required String ownerlogo,
    required String owneraddress,
    required String owneremail,
    required String ownerlocation,
    required String ownerphone,
    required String category,
    required String unit,
    required String deposit,
    required String price,
    required String title,
    required String payed,
    required String rating,
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
    Expression<int>? id,
    Expression<String>? onlineid,
    Expression<String>? ownerid,
    Expression<String>? ownername,
    Expression<String>? ownerlogo,
    Expression<String>? owneraddress,
    Expression<String>? owneremail,
    Expression<String>? ownerlocation,
    Expression<String>? ownerphone,
    Expression<String>? category,
    Expression<String>? unit,
    Expression<String>? deposit,
    Expression<String>? price,
    Expression<String>? title,
    Expression<String>? payed,
    Expression<String>? rating,
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
      {Value<int>? id,
      Value<String>? onlineid,
      Value<String>? ownerid,
      Value<String>? ownername,
      Value<String>? ownerlogo,
      Value<String>? owneraddress,
      Value<String>? owneremail,
      Value<String>? ownerlocation,
      Value<String>? ownerphone,
      Value<String>? category,
      Value<String>? unit,
      Value<String>? deposit,
      Value<String>? price,
      Value<String>? title,
      Value<String>? payed,
      Value<String>? rating}) {
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
  final String? _alias;
  $MyHouseDetailsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneridMeta = const VerificationMeta('ownerid');
  @override
  late final GeneratedTextColumn ownerid = _constructOwnerid();
  GeneratedTextColumn _constructOwnerid() {
    return GeneratedTextColumn(
      'ownerid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownernameMeta = const VerificationMeta('ownername');
  @override
  late final GeneratedTextColumn ownername = _constructOwnername();
  GeneratedTextColumn _constructOwnername() {
    return GeneratedTextColumn(
      'ownername',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlogoMeta = const VerificationMeta('ownerlogo');
  @override
  late final GeneratedTextColumn ownerlogo = _constructOwnerlogo();
  GeneratedTextColumn _constructOwnerlogo() {
    return GeneratedTextColumn(
      'ownerlogo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneraddressMeta =
      const VerificationMeta('owneraddress');
  @override
  late final GeneratedTextColumn owneraddress = _constructOwneraddress();
  GeneratedTextColumn _constructOwneraddress() {
    return GeneratedTextColumn(
      'owneraddress',
      $tableName,
      false,
    );
  }

  final VerificationMeta _owneremailMeta = const VerificationMeta('owneremail');
  @override
  late final GeneratedTextColumn owneremail = _constructOwneremail();
  GeneratedTextColumn _constructOwneremail() {
    return GeneratedTextColumn(
      'owneremail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerlocationMeta =
      const VerificationMeta('ownerlocation');
  @override
  late final GeneratedTextColumn ownerlocation = _constructOwnerlocation();
  GeneratedTextColumn _constructOwnerlocation() {
    return GeneratedTextColumn(
      'ownerlocation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ownerphoneMeta = const VerificationMeta('ownerphone');
  @override
  late final GeneratedTextColumn ownerphone = _constructOwnerphone();
  GeneratedTextColumn _constructOwnerphone() {
    return GeneratedTextColumn(
      'ownerphone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedTextColumn category = _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedTextColumn unit = _constructUnit();
  GeneratedTextColumn _constructUnit() {
    return GeneratedTextColumn(
      'unit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositMeta = const VerificationMeta('deposit');
  @override
  late final GeneratedTextColumn deposit = _constructDeposit();
  GeneratedTextColumn _constructDeposit() {
    return GeneratedTextColumn(
      'deposit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedTextColumn price = _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _payedMeta = const VerificationMeta('payed');
  @override
  late final GeneratedTextColumn payed = _constructPayed();
  GeneratedTextColumn _constructPayed() {
    return GeneratedTextColumn(
      'payed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedTextColumn rating = _constructRating();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('ownerid')) {
      context.handle(_owneridMeta,
          ownerid.isAcceptableOrUnknown(data['ownerid']!, _owneridMeta));
    } else if (isInserting) {
      context.missing(_owneridMeta);
    }
    if (data.containsKey('ownername')) {
      context.handle(_ownernameMeta,
          ownername.isAcceptableOrUnknown(data['ownername']!, _ownernameMeta));
    } else if (isInserting) {
      context.missing(_ownernameMeta);
    }
    if (data.containsKey('ownerlogo')) {
      context.handle(_ownerlogoMeta,
          ownerlogo.isAcceptableOrUnknown(data['ownerlogo']!, _ownerlogoMeta));
    } else if (isInserting) {
      context.missing(_ownerlogoMeta);
    }
    if (data.containsKey('owneraddress')) {
      context.handle(
          _owneraddressMeta,
          owneraddress.isAcceptableOrUnknown(
              data['owneraddress']!, _owneraddressMeta));
    } else if (isInserting) {
      context.missing(_owneraddressMeta);
    }
    if (data.containsKey('owneremail')) {
      context.handle(
          _owneremailMeta,
          owneremail.isAcceptableOrUnknown(
              data['owneremail']!, _owneremailMeta));
    } else if (isInserting) {
      context.missing(_owneremailMeta);
    }
    if (data.containsKey('ownerlocation')) {
      context.handle(
          _ownerlocationMeta,
          ownerlocation.isAcceptableOrUnknown(
              data['ownerlocation']!, _ownerlocationMeta));
    } else if (isInserting) {
      context.missing(_ownerlocationMeta);
    }
    if (data.containsKey('ownerphone')) {
      context.handle(
          _ownerphoneMeta,
          ownerphone.isAcceptableOrUnknown(
              data['ownerphone']!, _ownerphoneMeta));
    } else if (isInserting) {
      context.missing(_ownerphoneMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta));
    } else if (isInserting) {
      context.missing(_depositMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('payed')) {
      context.handle(
          _payedMeta, payed.isAcceptableOrUnknown(data['payed']!, _payedMeta));
    } else if (isInserting) {
      context.missing(_payedMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHouseDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyHouseDetail.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
      {required this.id,
      required this.onlineid,
      required this.amount,
      required this.year,
      required this.month});
  factory MyHouseArrear.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyHouseArrear(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      year: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year'])!,
      month: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onlineid'] = Variable<String>(onlineid);
    map['amount'] = Variable<String>(amount);
    map['year'] = Variable<String>(year);
    map['month'] = Variable<String>(month);
    return map;
  }

  MyHouseArrearsCompanion toCompanion(bool nullToAbsent) {
    return MyHouseArrearsCompanion(
      id: Value(id),
      onlineid: Value(onlineid),
      amount: Value(amount),
      year: Value(year),
      month: Value(month),
    );
  }

  factory MyHouseArrear.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
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
          {int? id,
          String? onlineid,
          String? amount,
          String? year,
          String? month}) =>
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
  bool operator ==(Object other) =>
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
    required String onlineid,
    required String amount,
    required String year,
    required String month,
  })  : onlineid = Value(onlineid),
        amount = Value(amount),
        year = Value(year),
        month = Value(month);
  static Insertable<MyHouseArrear> custom({
    Expression<int>? id,
    Expression<String>? onlineid,
    Expression<String>? amount,
    Expression<String>? year,
    Expression<String>? month,
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
      {Value<int>? id,
      Value<String>? onlineid,
      Value<String>? amount,
      Value<String>? year,
      Value<String>? month}) {
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
  final String? _alias;
  $MyHouseArrearsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedTextColumn year = _constructYear();
  GeneratedTextColumn _constructYear() {
    return GeneratedTextColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedTextColumn month = _constructMonth();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHouseArrear map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyHouseArrear.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
      {required this.id,
      required this.onlineid,
      required this.transactionid,
      required this.amount,
      required this.status,
      required this.time,
      required this.year,
      required this.month,
      required this.type});
  factory MyHousePayment.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyHousePayment(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      transactionid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transactionid'])!,
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      year: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}year'])!,
      month: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}month'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onlineid'] = Variable<String>(onlineid);
    map['transactionid'] = Variable<String>(transactionid);
    map['amount'] = Variable<String>(amount);
    map['status'] = Variable<String>(status);
    map['time'] = Variable<String>(time);
    map['year'] = Variable<String>(year);
    map['month'] = Variable<String>(month);
    map['type'] = Variable<String>(type);
    return map;
  }

  MyHousePaymentsCompanion toCompanion(bool nullToAbsent) {
    return MyHousePaymentsCompanion(
      id: Value(id),
      onlineid: Value(onlineid),
      transactionid: Value(transactionid),
      amount: Value(amount),
      status: Value(status),
      time: Value(time),
      year: Value(year),
      month: Value(month),
      type: Value(type),
    );
  }

  factory MyHousePayment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
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
          {int? id,
          String? onlineid,
          String? transactionid,
          String? amount,
          String? status,
          String? time,
          String? year,
          String? month,
          String? type}) =>
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
  bool operator ==(Object other) =>
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
    required String onlineid,
    required String transactionid,
    required String amount,
    required String status,
    required String time,
    required String year,
    required String month,
    required String type,
  })  : onlineid = Value(onlineid),
        transactionid = Value(transactionid),
        amount = Value(amount),
        status = Value(status),
        time = Value(time),
        year = Value(year),
        month = Value(month),
        type = Value(type);
  static Insertable<MyHousePayment> custom({
    Expression<int>? id,
    Expression<String>? onlineid,
    Expression<String>? transactionid,
    Expression<String>? amount,
    Expression<String>? status,
    Expression<String>? time,
    Expression<String>? year,
    Expression<String>? month,
    Expression<String>? type,
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
      {Value<int>? id,
      Value<String>? onlineid,
      Value<String>? transactionid,
      Value<String>? amount,
      Value<String>? status,
      Value<String>? time,
      Value<String>? year,
      Value<String>? month,
      Value<String>? type}) {
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
  final String? _alias;
  $MyHousePaymentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _transactionidMeta =
      const VerificationMeta('transactionid');
  @override
  late final GeneratedTextColumn transactionid = _constructTransactionid();
  GeneratedTextColumn _constructTransactionid() {
    return GeneratedTextColumn(
      'transactionid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedTextColumn status = _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedTextColumn time = _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn(
      'time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedTextColumn year = _constructYear();
  GeneratedTextColumn _constructYear() {
    return GeneratedTextColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedTextColumn month = _constructMonth();
  GeneratedTextColumn _constructMonth() {
    return GeneratedTextColumn(
      'month',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedTextColumn type = _constructType();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('transactionid')) {
      context.handle(
          _transactionidMeta,
          transactionid.isAcceptableOrUnknown(
              data['transactionid']!, _transactionidMeta));
    } else if (isInserting) {
      context.missing(_transactionidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHousePayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyHousePayment.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final String? address;
  final String? location;
  final String email;
  final String? twitter;
  final String? facebook;
  final String? instagram;
  Contact(
      {required this.id,
      required this.onlineid,
      required this.phone,
      this.address,
      this.location,
      required this.email,
      this.twitter,
      this.facebook,
      this.instagram});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Contact(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      twitter: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}twitter']),
      facebook: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}facebook']),
      instagram: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}instagram']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onlineid'] = Variable<String>(onlineid);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String?>(location);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || twitter != null) {
      map['twitter'] = Variable<String?>(twitter);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String?>(facebook);
    }
    if (!nullToAbsent || instagram != null) {
      map['instagram'] = Variable<String?>(instagram);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: Value(id),
      onlineid: Value(onlineid),
      phone: Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      email: Value(email),
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
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      onlineid: serializer.fromJson<String>(json['onlineid']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      location: serializer.fromJson<String?>(json['location']),
      email: serializer.fromJson<String>(json['email']),
      twitter: serializer.fromJson<String?>(json['twitter']),
      facebook: serializer.fromJson<String?>(json['facebook']),
      instagram: serializer.fromJson<String?>(json['instagram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onlineid': serializer.toJson<String>(onlineid),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String?>(address),
      'location': serializer.toJson<String?>(location),
      'email': serializer.toJson<String>(email),
      'twitter': serializer.toJson<String?>(twitter),
      'facebook': serializer.toJson<String?>(facebook),
      'instagram': serializer.toJson<String?>(instagram),
    };
  }

  Contact copyWith(
          {int? id,
          String? onlineid,
          String? phone,
          String? address,
          String? location,
          String? email,
          String? twitter,
          String? facebook,
          String? instagram}) =>
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
  bool operator ==(Object other) =>
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
  final Value<String?> address;
  final Value<String?> location;
  final Value<String> email;
  final Value<String?> twitter;
  final Value<String?> facebook;
  final Value<String?> instagram;
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
    required String onlineid,
    required String phone,
    this.address = const Value.absent(),
    this.location = const Value.absent(),
    required String email,
    this.twitter = const Value.absent(),
    this.facebook = const Value.absent(),
    this.instagram = const Value.absent(),
  })  : onlineid = Value(onlineid),
        phone = Value(phone),
        email = Value(email);
  static Insertable<Contact> custom({
    Expression<int>? id,
    Expression<String>? onlineid,
    Expression<String>? phone,
    Expression<String?>? address,
    Expression<String?>? location,
    Expression<String>? email,
    Expression<String?>? twitter,
    Expression<String?>? facebook,
    Expression<String?>? instagram,
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
      {Value<int>? id,
      Value<String>? onlineid,
      Value<String>? phone,
      Value<String?>? address,
      Value<String?>? location,
      Value<String>? email,
      Value<String?>? twitter,
      Value<String?>? facebook,
      Value<String?>? instagram}) {
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
      map['address'] = Variable<String?>(address.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (twitter.present) {
      map['twitter'] = Variable<String?>(twitter.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String?>(facebook.value);
    }
    if (instagram.present) {
      map['instagram'] = Variable<String?>(instagram.value);
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
  final String? _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedTextColumn phone = _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedTextColumn address = _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedTextColumn location = _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _twitterMeta = const VerificationMeta('twitter');
  @override
  late final GeneratedTextColumn twitter = _constructTwitter();
  GeneratedTextColumn _constructTwitter() {
    return GeneratedTextColumn(
      'twitter',
      $tableName,
      true,
    );
  }

  final VerificationMeta _facebookMeta = const VerificationMeta('facebook');
  @override
  late final GeneratedTextColumn facebook = _constructFacebook();
  GeneratedTextColumn _constructFacebook() {
    return GeneratedTextColumn(
      'facebook',
      $tableName,
      true,
    );
  }

  final VerificationMeta _instagramMeta = const VerificationMeta('instagram');
  @override
  late final GeneratedTextColumn instagram = _constructInstagram();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('twitter')) {
      context.handle(_twitterMeta,
          twitter.isAcceptableOrUnknown(data['twitter']!, _twitterMeta));
    }
    if (data.containsKey('facebook')) {
      context.handle(_facebookMeta,
          facebook.isAcceptableOrUnknown(data['facebook']!, _facebookMeta));
    }
    if (data.containsKey('instagram')) {
      context.handle(_instagramMeta,
          instagram.isAcceptableOrUnknown(data['instagram']!, _instagramMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Contact.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final String? apartmentId;
  final bool? like;
  final bool? dislike;
  final String? comment;
  OfflineActivityData(
      {required this.id,
      required this.userId,
      this.apartmentId,
      this.like,
      this.dislike,
      this.comment});
  factory OfflineActivityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflineActivityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      apartmentId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}apartment_id']),
      like: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}like']),
      dislike: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dislike']),
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || apartmentId != null) {
      map['apartment_id'] = Variable<String?>(apartmentId);
    }
    if (!nullToAbsent || like != null) {
      map['like'] = Variable<bool?>(like);
    }
    if (!nullToAbsent || dislike != null) {
      map['dislike'] = Variable<bool?>(dislike);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String?>(comment);
    }
    return map;
  }

  OfflineActivityCompanion toCompanion(bool nullToAbsent) {
    return OfflineActivityCompanion(
      id: Value(id),
      userId: Value(userId),
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
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflineActivityData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      apartmentId: serializer.fromJson<String?>(json['apartmentId']),
      like: serializer.fromJson<bool?>(json['like']),
      dislike: serializer.fromJson<bool?>(json['dislike']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'apartmentId': serializer.toJson<String?>(apartmentId),
      'like': serializer.toJson<bool?>(like),
      'dislike': serializer.toJson<bool?>(dislike),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  OfflineActivityData copyWith(
          {int? id,
          String? userId,
          String? apartmentId,
          bool? like,
          bool? dislike,
          String? comment}) =>
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
  bool operator ==(Object other) =>
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
  final Value<String?> apartmentId;
  final Value<bool?> like;
  final Value<bool?> dislike;
  final Value<String?> comment;
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
    required String userId,
    this.apartmentId = const Value.absent(),
    this.like = const Value.absent(),
    this.dislike = const Value.absent(),
    this.comment = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<OfflineActivityData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String?>? apartmentId,
    Expression<bool?>? like,
    Expression<bool?>? dislike,
    Expression<String?>? comment,
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
      {Value<int>? id,
      Value<String>? userId,
      Value<String?>? apartmentId,
      Value<bool?>? like,
      Value<bool?>? dislike,
      Value<String?>? comment}) {
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
      map['apartment_id'] = Variable<String?>(apartmentId.value);
    }
    if (like.present) {
      map['like'] = Variable<bool?>(like.value);
    }
    if (dislike.present) {
      map['dislike'] = Variable<bool?>(dislike.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String?>(comment.value);
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
  final String? _alias;
  $OfflineActivityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedTextColumn userId = _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _apartmentIdMeta =
      const VerificationMeta('apartmentId');
  @override
  late final GeneratedTextColumn apartmentId = _constructApartmentId();
  GeneratedTextColumn _constructApartmentId() {
    return GeneratedTextColumn(
      'apartment_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _likeMeta = const VerificationMeta('like');
  @override
  late final GeneratedBoolColumn like = _constructLike();
  GeneratedBoolColumn _constructLike() {
    return GeneratedBoolColumn(
      'like',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dislikeMeta = const VerificationMeta('dislike');
  @override
  late final GeneratedBoolColumn dislike = _constructDislike();
  GeneratedBoolColumn _constructDislike() {
    return GeneratedBoolColumn(
      'dislike',
      $tableName,
      true,
    );
  }

  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  @override
  late final GeneratedTextColumn comment = _constructComment();
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
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('apartment_id')) {
      context.handle(
          _apartmentIdMeta,
          apartmentId.isAcceptableOrUnknown(
              data['apartment_id']!, _apartmentIdMeta));
    }
    if (data.containsKey('like')) {
      context.handle(
          _likeMeta, like.isAcceptableOrUnknown(data['like']!, _likeMeta));
    }
    if (data.containsKey('dislike')) {
      context.handle(_dislikeMeta,
          dislike.isAcceptableOrUnknown(data['dislike']!, _dislikeMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflineActivityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflineActivityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OfflineActivityTable createAlias(String alias) {
    return $OfflineActivityTable(_db, alias);
  }
}

class TransactionsTableData extends DataClass
    implements Insertable<TransactionsTableData> {
  final String onlineid;
  final String? amount;
  final String? token;
  final String? units;
  final String? account;
  final String? biller_code;
  final String? transaction_id;
  final String? status;
  final String? date;
  final String? time;
  TransactionsTableData(
      {required this.onlineid,
      this.amount,
      this.token,
      this.units,
      this.account,
      this.biller_code,
      this.transaction_id,
      this.status,
      this.date,
      this.time});
  factory TransactionsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TransactionsTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token']),
      units: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}units']),
      account: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account']),
      biller_code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}biller_code']),
      transaction_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_id']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String?>(amount);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String?>(token);
    }
    if (!nullToAbsent || units != null) {
      map['units'] = Variable<String?>(units);
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<String?>(account);
    }
    if (!nullToAbsent || biller_code != null) {
      map['biller_code'] = Variable<String?>(biller_code);
    }
    if (!nullToAbsent || transaction_id != null) {
      map['transaction_id'] = Variable<String?>(transaction_id);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String?>(date);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String?>(time);
    }
    return map;
  }

  TransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionsTableCompanion(
      onlineid: Value(onlineid),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      units:
          units == null && nullToAbsent ? const Value.absent() : Value(units),
      account: account == null && nullToAbsent
          ? const Value.absent()
          : Value(account),
      biller_code: biller_code == null && nullToAbsent
          ? const Value.absent()
          : Value(biller_code),
      transaction_id: transaction_id == null && nullToAbsent
          ? const Value.absent()
          : Value(transaction_id),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  factory TransactionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TransactionsTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      amount: serializer.fromJson<String?>(json['amount']),
      token: serializer.fromJson<String?>(json['token']),
      units: serializer.fromJson<String?>(json['units']),
      account: serializer.fromJson<String?>(json['account']),
      biller_code: serializer.fromJson<String?>(json['biller_code']),
      transaction_id: serializer.fromJson<String?>(json['transaction_id']),
      status: serializer.fromJson<String?>(json['status']),
      date: serializer.fromJson<String?>(json['date']),
      time: serializer.fromJson<String?>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'amount': serializer.toJson<String?>(amount),
      'token': serializer.toJson<String?>(token),
      'units': serializer.toJson<String?>(units),
      'account': serializer.toJson<String?>(account),
      'biller_code': serializer.toJson<String?>(biller_code),
      'transaction_id': serializer.toJson<String?>(transaction_id),
      'status': serializer.toJson<String?>(status),
      'date': serializer.toJson<String?>(date),
      'time': serializer.toJson<String?>(time),
    };
  }

  TransactionsTableData copyWith(
          {String? onlineid,
          String? amount,
          String? token,
          String? units,
          String? account,
          String? biller_code,
          String? transaction_id,
          String? status,
          String? date,
          String? time}) =>
      TransactionsTableData(
        onlineid: onlineid ?? this.onlineid,
        amount: amount ?? this.amount,
        token: token ?? this.token,
        units: units ?? this.units,
        account: account ?? this.account,
        biller_code: biller_code ?? this.biller_code,
        transaction_id: transaction_id ?? this.transaction_id,
        status: status ?? this.status,
        date: date ?? this.date,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionsTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('amount: $amount, ')
          ..write('token: $token, ')
          ..write('units: $units, ')
          ..write('account: $account, ')
          ..write('biller_code: $biller_code, ')
          ..write('transaction_id: $transaction_id, ')
          ..write('status: $status, ')
          ..write('date: $date, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          amount.hashCode,
          $mrjc(
              token.hashCode,
              $mrjc(
                  units.hashCode,
                  $mrjc(
                      account.hashCode,
                      $mrjc(
                          biller_code.hashCode,
                          $mrjc(
                              transaction_id.hashCode,
                              $mrjc(status.hashCode,
                                  $mrjc(date.hashCode, time.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionsTableData &&
          other.onlineid == this.onlineid &&
          other.amount == this.amount &&
          other.token == this.token &&
          other.units == this.units &&
          other.account == this.account &&
          other.biller_code == this.biller_code &&
          other.transaction_id == this.transaction_id &&
          other.status == this.status &&
          other.date == this.date &&
          other.time == this.time);
}

class TransactionsTableCompanion
    extends UpdateCompanion<TransactionsTableData> {
  final Value<String> onlineid;
  final Value<String?> amount;
  final Value<String?> token;
  final Value<String?> units;
  final Value<String?> account;
  final Value<String?> biller_code;
  final Value<String?> transaction_id;
  final Value<String?> status;
  final Value<String?> date;
  final Value<String?> time;
  const TransactionsTableCompanion({
    this.onlineid = const Value.absent(),
    this.amount = const Value.absent(),
    this.token = const Value.absent(),
    this.units = const Value.absent(),
    this.account = const Value.absent(),
    this.biller_code = const Value.absent(),
    this.transaction_id = const Value.absent(),
    this.status = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
  });
  TransactionsTableCompanion.insert({
    required String onlineid,
    this.amount = const Value.absent(),
    this.token = const Value.absent(),
    this.units = const Value.absent(),
    this.account = const Value.absent(),
    this.biller_code = const Value.absent(),
    this.transaction_id = const Value.absent(),
    this.status = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<TransactionsTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? amount,
    Expression<String?>? token,
    Expression<String?>? units,
    Expression<String?>? account,
    Expression<String?>? biller_code,
    Expression<String?>? transaction_id,
    Expression<String?>? status,
    Expression<String?>? date,
    Expression<String?>? time,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (amount != null) 'amount': amount,
      if (token != null) 'token': token,
      if (units != null) 'units': units,
      if (account != null) 'account': account,
      if (biller_code != null) 'biller_code': biller_code,
      if (transaction_id != null) 'transaction_id': transaction_id,
      if (status != null) 'status': status,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
    });
  }

  TransactionsTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? amount,
      Value<String?>? token,
      Value<String?>? units,
      Value<String?>? account,
      Value<String?>? biller_code,
      Value<String?>? transaction_id,
      Value<String?>? status,
      Value<String?>? date,
      Value<String?>? time}) {
    return TransactionsTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      amount: amount ?? this.amount,
      token: token ?? this.token,
      units: units ?? this.units,
      account: account ?? this.account,
      biller_code: biller_code ?? this.biller_code,
      transaction_id: transaction_id ?? this.transaction_id,
      status: status ?? this.status,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String?>(amount.value);
    }
    if (token.present) {
      map['token'] = Variable<String?>(token.value);
    }
    if (units.present) {
      map['units'] = Variable<String?>(units.value);
    }
    if (account.present) {
      map['account'] = Variable<String?>(account.value);
    }
    if (biller_code.present) {
      map['biller_code'] = Variable<String?>(biller_code.value);
    }
    if (transaction_id.present) {
      map['transaction_id'] = Variable<String?>(transaction_id.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (date.present) {
      map['date'] = Variable<String?>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String?>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('amount: $amount, ')
          ..write('token: $token, ')
          ..write('units: $units, ')
          ..write('account: $account, ')
          ..write('biller_code: $biller_code, ')
          ..write('transaction_id: $transaction_id, ')
          ..write('status: $status, ')
          ..write('date: $date, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTableTable extends TransactionsTable
    with TableInfo<$TransactionsTableTable, TransactionsTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TransactionsTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedTextColumn token = _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedTextColumn units = _constructUnits();
  GeneratedTextColumn _constructUnits() {
    return GeneratedTextColumn(
      'units',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  @override
  late final GeneratedTextColumn account = _constructAccount();
  GeneratedTextColumn _constructAccount() {
    return GeneratedTextColumn(
      'account',
      $tableName,
      true,
    );
  }

  final VerificationMeta _biller_codeMeta =
      const VerificationMeta('biller_code');
  @override
  late final GeneratedTextColumn biller_code = _constructBillerCode();
  GeneratedTextColumn _constructBillerCode() {
    return GeneratedTextColumn(
      'biller_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _transaction_idMeta =
      const VerificationMeta('transaction_id');
  @override
  late final GeneratedTextColumn transaction_id = _constructTransactionId();
  GeneratedTextColumn _constructTransactionId() {
    return GeneratedTextColumn(
      'transaction_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedTextColumn status = _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedTextColumn date = _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedTextColumn time = _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn(
      'time',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        onlineid,
        amount,
        token,
        units,
        account,
        biller_code,
        transaction_id,
        status,
        date,
        time
      ];
  @override
  $TransactionsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transactions_table';
  @override
  final String actualTableName = 'transactions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    }
    if (data.containsKey('biller_code')) {
      context.handle(
          _biller_codeMeta,
          biller_code.isAcceptableOrUnknown(
              data['biller_code']!, _biller_codeMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transaction_idMeta,
          transaction_id.isAcceptableOrUnknown(
              data['transaction_id']!, _transaction_idMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  TransactionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TransactionsTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionsTableTable createAlias(String alias) {
    return $TransactionsTableTable(_db, alias);
  }
}

class BillerTableData extends DataClass implements Insertable<BillerTableData> {
  final String onlineid;
  final String? biller_name;
  final String? biller_category;
  final String? minimum_balance;
  final String? secondary_account;
  final String? biller_code;
  final bool? enabled;
  BillerTableData(
      {required this.onlineid,
      this.biller_name,
      this.biller_category,
      this.minimum_balance,
      this.secondary_account,
      this.biller_code,
      this.enabled});
  factory BillerTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BillerTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      biller_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}biller_name']),
      biller_category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}biller_category']),
      minimum_balance: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}minimum_balance']),
      secondary_account: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}secondary_account']),
      biller_code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}biller_code']),
      enabled: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enabled']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || biller_name != null) {
      map['biller_name'] = Variable<String?>(biller_name);
    }
    if (!nullToAbsent || biller_category != null) {
      map['biller_category'] = Variable<String?>(biller_category);
    }
    if (!nullToAbsent || minimum_balance != null) {
      map['minimum_balance'] = Variable<String?>(minimum_balance);
    }
    if (!nullToAbsent || secondary_account != null) {
      map['secondary_account'] = Variable<String?>(secondary_account);
    }
    if (!nullToAbsent || biller_code != null) {
      map['biller_code'] = Variable<String?>(biller_code);
    }
    if (!nullToAbsent || enabled != null) {
      map['enabled'] = Variable<bool?>(enabled);
    }
    return map;
  }

  BillerTableCompanion toCompanion(bool nullToAbsent) {
    return BillerTableCompanion(
      onlineid: Value(onlineid),
      biller_name: biller_name == null && nullToAbsent
          ? const Value.absent()
          : Value(biller_name),
      biller_category: biller_category == null && nullToAbsent
          ? const Value.absent()
          : Value(biller_category),
      minimum_balance: minimum_balance == null && nullToAbsent
          ? const Value.absent()
          : Value(minimum_balance),
      secondary_account: secondary_account == null && nullToAbsent
          ? const Value.absent()
          : Value(secondary_account),
      biller_code: biller_code == null && nullToAbsent
          ? const Value.absent()
          : Value(biller_code),
      enabled: enabled == null && nullToAbsent
          ? const Value.absent()
          : Value(enabled),
    );
  }

  factory BillerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BillerTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      biller_name: serializer.fromJson<String?>(json['biller_name']),
      biller_category: serializer.fromJson<String?>(json['biller_category']),
      minimum_balance: serializer.fromJson<String?>(json['minimum_balance']),
      secondary_account:
          serializer.fromJson<String?>(json['secondary_account']),
      biller_code: serializer.fromJson<String?>(json['biller_code']),
      enabled: serializer.fromJson<bool?>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'biller_name': serializer.toJson<String?>(biller_name),
      'biller_category': serializer.toJson<String?>(biller_category),
      'minimum_balance': serializer.toJson<String?>(minimum_balance),
      'secondary_account': serializer.toJson<String?>(secondary_account),
      'biller_code': serializer.toJson<String?>(biller_code),
      'enabled': serializer.toJson<bool?>(enabled),
    };
  }

  BillerTableData copyWith(
          {String? onlineid,
          String? biller_name,
          String? biller_category,
          String? minimum_balance,
          String? secondary_account,
          String? biller_code,
          bool? enabled}) =>
      BillerTableData(
        onlineid: onlineid ?? this.onlineid,
        biller_name: biller_name ?? this.biller_name,
        biller_category: biller_category ?? this.biller_category,
        minimum_balance: minimum_balance ?? this.minimum_balance,
        secondary_account: secondary_account ?? this.secondary_account,
        biller_code: biller_code ?? this.biller_code,
        enabled: enabled ?? this.enabled,
      );
  @override
  String toString() {
    return (StringBuffer('BillerTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('biller_name: $biller_name, ')
          ..write('biller_category: $biller_category, ')
          ..write('minimum_balance: $minimum_balance, ')
          ..write('secondary_account: $secondary_account, ')
          ..write('biller_code: $biller_code, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          biller_name.hashCode,
          $mrjc(
              biller_category.hashCode,
              $mrjc(
                  minimum_balance.hashCode,
                  $mrjc(secondary_account.hashCode,
                      $mrjc(biller_code.hashCode, enabled.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillerTableData &&
          other.onlineid == this.onlineid &&
          other.biller_name == this.biller_name &&
          other.biller_category == this.biller_category &&
          other.minimum_balance == this.minimum_balance &&
          other.secondary_account == this.secondary_account &&
          other.biller_code == this.biller_code &&
          other.enabled == this.enabled);
}

class BillerTableCompanion extends UpdateCompanion<BillerTableData> {
  final Value<String> onlineid;
  final Value<String?> biller_name;
  final Value<String?> biller_category;
  final Value<String?> minimum_balance;
  final Value<String?> secondary_account;
  final Value<String?> biller_code;
  final Value<bool?> enabled;
  const BillerTableCompanion({
    this.onlineid = const Value.absent(),
    this.biller_name = const Value.absent(),
    this.biller_category = const Value.absent(),
    this.minimum_balance = const Value.absent(),
    this.secondary_account = const Value.absent(),
    this.biller_code = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  BillerTableCompanion.insert({
    required String onlineid,
    this.biller_name = const Value.absent(),
    this.biller_category = const Value.absent(),
    this.minimum_balance = const Value.absent(),
    this.secondary_account = const Value.absent(),
    this.biller_code = const Value.absent(),
    this.enabled = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<BillerTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? biller_name,
    Expression<String?>? biller_category,
    Expression<String?>? minimum_balance,
    Expression<String?>? secondary_account,
    Expression<String?>? biller_code,
    Expression<bool?>? enabled,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (biller_name != null) 'biller_name': biller_name,
      if (biller_category != null) 'biller_category': biller_category,
      if (minimum_balance != null) 'minimum_balance': minimum_balance,
      if (secondary_account != null) 'secondary_account': secondary_account,
      if (biller_code != null) 'biller_code': biller_code,
      if (enabled != null) 'enabled': enabled,
    });
  }

  BillerTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? biller_name,
      Value<String?>? biller_category,
      Value<String?>? minimum_balance,
      Value<String?>? secondary_account,
      Value<String?>? biller_code,
      Value<bool?>? enabled}) {
    return BillerTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      biller_name: biller_name ?? this.biller_name,
      biller_category: biller_category ?? this.biller_category,
      minimum_balance: minimum_balance ?? this.minimum_balance,
      secondary_account: secondary_account ?? this.secondary_account,
      biller_code: biller_code ?? this.biller_code,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (biller_name.present) {
      map['biller_name'] = Variable<String?>(biller_name.value);
    }
    if (biller_category.present) {
      map['biller_category'] = Variable<String?>(biller_category.value);
    }
    if (minimum_balance.present) {
      map['minimum_balance'] = Variable<String?>(minimum_balance.value);
    }
    if (secondary_account.present) {
      map['secondary_account'] = Variable<String?>(secondary_account.value);
    }
    if (biller_code.present) {
      map['biller_code'] = Variable<String?>(biller_code.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool?>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillerTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('biller_name: $biller_name, ')
          ..write('biller_category: $biller_category, ')
          ..write('minimum_balance: $minimum_balance, ')
          ..write('secondary_account: $secondary_account, ')
          ..write('biller_code: $biller_code, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $BillerTableTable extends BillerTable
    with TableInfo<$BillerTableTable, BillerTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BillerTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _biller_nameMeta =
      const VerificationMeta('biller_name');
  @override
  late final GeneratedTextColumn biller_name = _constructBillerName();
  GeneratedTextColumn _constructBillerName() {
    return GeneratedTextColumn(
      'biller_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _biller_categoryMeta =
      const VerificationMeta('biller_category');
  @override
  late final GeneratedTextColumn biller_category = _constructBillerCategory();
  GeneratedTextColumn _constructBillerCategory() {
    return GeneratedTextColumn(
      'biller_category',
      $tableName,
      true,
    );
  }

  final VerificationMeta _minimum_balanceMeta =
      const VerificationMeta('minimum_balance');
  @override
  late final GeneratedTextColumn minimum_balance = _constructMinimumBalance();
  GeneratedTextColumn _constructMinimumBalance() {
    return GeneratedTextColumn(
      'minimum_balance',
      $tableName,
      true,
    );
  }

  final VerificationMeta _secondary_accountMeta =
      const VerificationMeta('secondary_account');
  @override
  late final GeneratedTextColumn secondary_account =
      _constructSecondaryAccount();
  GeneratedTextColumn _constructSecondaryAccount() {
    return GeneratedTextColumn(
      'secondary_account',
      $tableName,
      true,
    );
  }

  final VerificationMeta _biller_codeMeta =
      const VerificationMeta('biller_code');
  @override
  late final GeneratedTextColumn biller_code = _constructBillerCode();
  GeneratedTextColumn _constructBillerCode() {
    return GeneratedTextColumn(
      'biller_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _enabledMeta = const VerificationMeta('enabled');
  @override
  late final GeneratedBoolColumn enabled = _constructEnabled();
  GeneratedBoolColumn _constructEnabled() {
    return GeneratedBoolColumn(
      'enabled',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        onlineid,
        biller_name,
        biller_category,
        minimum_balance,
        secondary_account,
        biller_code,
        enabled
      ];
  @override
  $BillerTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'biller_table';
  @override
  final String actualTableName = 'biller_table';
  @override
  VerificationContext validateIntegrity(Insertable<BillerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('biller_name')) {
      context.handle(
          _biller_nameMeta,
          biller_name.isAcceptableOrUnknown(
              data['biller_name']!, _biller_nameMeta));
    }
    if (data.containsKey('biller_category')) {
      context.handle(
          _biller_categoryMeta,
          biller_category.isAcceptableOrUnknown(
              data['biller_category']!, _biller_categoryMeta));
    }
    if (data.containsKey('minimum_balance')) {
      context.handle(
          _minimum_balanceMeta,
          minimum_balance.isAcceptableOrUnknown(
              data['minimum_balance']!, _minimum_balanceMeta));
    }
    if (data.containsKey('secondary_account')) {
      context.handle(
          _secondary_accountMeta,
          secondary_account.isAcceptableOrUnknown(
              data['secondary_account']!, _secondary_accountMeta));
    }
    if (data.containsKey('biller_code')) {
      context.handle(
          _biller_codeMeta,
          biller_code.isAcceptableOrUnknown(
              data['biller_code']!, _biller_codeMeta));
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  BillerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BillerTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BillerTableTable createAlias(String alias) {
    return $BillerTableTable(_db, alias);
  }
}

class BuildingUnitTableData extends DataClass
    implements Insertable<BuildingUnitTableData> {
  final int id;
  final String buildingid;
  final String category;
  final String deposit;
  final String rent;
  BuildingUnitTableData(
      {required this.id,
      required this.buildingid,
      required this.category,
      required this.deposit,
      required this.rent});
  factory BuildingUnitTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BuildingUnitTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      buildingid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}buildingid'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      deposit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit'])!,
      rent: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rent'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['buildingid'] = Variable<String>(buildingid);
    map['category'] = Variable<String>(category);
    map['deposit'] = Variable<String>(deposit);
    map['rent'] = Variable<String>(rent);
    return map;
  }

  BuildingUnitTableCompanion toCompanion(bool nullToAbsent) {
    return BuildingUnitTableCompanion(
      id: Value(id),
      buildingid: Value(buildingid),
      category: Value(category),
      deposit: Value(deposit),
      rent: Value(rent),
    );
  }

  factory BuildingUnitTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BuildingUnitTableData(
      id: serializer.fromJson<int>(json['id']),
      buildingid: serializer.fromJson<String>(json['buildingid']),
      category: serializer.fromJson<String>(json['category']),
      deposit: serializer.fromJson<String>(json['deposit']),
      rent: serializer.fromJson<String>(json['rent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'buildingid': serializer.toJson<String>(buildingid),
      'category': serializer.toJson<String>(category),
      'deposit': serializer.toJson<String>(deposit),
      'rent': serializer.toJson<String>(rent),
    };
  }

  BuildingUnitTableData copyWith(
          {int? id,
          String? buildingid,
          String? category,
          String? deposit,
          String? rent}) =>
      BuildingUnitTableData(
        id: id ?? this.id,
        buildingid: buildingid ?? this.buildingid,
        category: category ?? this.category,
        deposit: deposit ?? this.deposit,
        rent: rent ?? this.rent,
      );
  @override
  String toString() {
    return (StringBuffer('BuildingUnitTableData(')
          ..write('id: $id, ')
          ..write('buildingid: $buildingid, ')
          ..write('category: $category, ')
          ..write('deposit: $deposit, ')
          ..write('rent: $rent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(buildingid.hashCode,
          $mrjc(category.hashCode, $mrjc(deposit.hashCode, rent.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuildingUnitTableData &&
          other.id == this.id &&
          other.buildingid == this.buildingid &&
          other.category == this.category &&
          other.deposit == this.deposit &&
          other.rent == this.rent);
}

class BuildingUnitTableCompanion
    extends UpdateCompanion<BuildingUnitTableData> {
  final Value<int> id;
  final Value<String> buildingid;
  final Value<String> category;
  final Value<String> deposit;
  final Value<String> rent;
  const BuildingUnitTableCompanion({
    this.id = const Value.absent(),
    this.buildingid = const Value.absent(),
    this.category = const Value.absent(),
    this.deposit = const Value.absent(),
    this.rent = const Value.absent(),
  });
  BuildingUnitTableCompanion.insert({
    this.id = const Value.absent(),
    required String buildingid,
    required String category,
    required String deposit,
    required String rent,
  })  : buildingid = Value(buildingid),
        category = Value(category),
        deposit = Value(deposit),
        rent = Value(rent);
  static Insertable<BuildingUnitTableData> custom({
    Expression<int>? id,
    Expression<String>? buildingid,
    Expression<String>? category,
    Expression<String>? deposit,
    Expression<String>? rent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (buildingid != null) 'buildingid': buildingid,
      if (category != null) 'category': category,
      if (deposit != null) 'deposit': deposit,
      if (rent != null) 'rent': rent,
    });
  }

  BuildingUnitTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? buildingid,
      Value<String>? category,
      Value<String>? deposit,
      Value<String>? rent}) {
    return BuildingUnitTableCompanion(
      id: id ?? this.id,
      buildingid: buildingid ?? this.buildingid,
      category: category ?? this.category,
      deposit: deposit ?? this.deposit,
      rent: rent ?? this.rent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (buildingid.present) {
      map['buildingid'] = Variable<String>(buildingid.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<String>(deposit.value);
    }
    if (rent.present) {
      map['rent'] = Variable<String>(rent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuildingUnitTableCompanion(')
          ..write('id: $id, ')
          ..write('buildingid: $buildingid, ')
          ..write('category: $category, ')
          ..write('deposit: $deposit, ')
          ..write('rent: $rent')
          ..write(')'))
        .toString();
  }
}

class $BuildingUnitTableTable extends BuildingUnitTable
    with TableInfo<$BuildingUnitTableTable, BuildingUnitTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BuildingUnitTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _buildingidMeta = const VerificationMeta('buildingid');
  @override
  late final GeneratedTextColumn buildingid = _constructBuildingid();
  GeneratedTextColumn _constructBuildingid() {
    return GeneratedTextColumn(
      'buildingid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedTextColumn category = _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositMeta = const VerificationMeta('deposit');
  @override
  late final GeneratedTextColumn deposit = _constructDeposit();
  GeneratedTextColumn _constructDeposit() {
    return GeneratedTextColumn(
      'deposit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rentMeta = const VerificationMeta('rent');
  @override
  late final GeneratedTextColumn rent = _constructRent();
  GeneratedTextColumn _constructRent() {
    return GeneratedTextColumn(
      'rent',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, buildingid, category, deposit, rent];
  @override
  $BuildingUnitTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'building_unit_table';
  @override
  final String actualTableName = 'building_unit_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BuildingUnitTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('buildingid')) {
      context.handle(
          _buildingidMeta,
          buildingid.isAcceptableOrUnknown(
              data['buildingid']!, _buildingidMeta));
    } else if (isInserting) {
      context.missing(_buildingidMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta));
    } else if (isInserting) {
      context.missing(_depositMeta);
    }
    if (data.containsKey('rent')) {
      context.handle(
          _rentMeta, rent.isAcceptableOrUnknown(data['rent']!, _rentMeta));
    } else if (isInserting) {
      context.missing(_rentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuildingUnitTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BuildingUnitTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BuildingUnitTableTable createAlias(String alias) {
    return $BuildingUnitTableTable(_db, alias);
  }
}

class HousePaymentsTableData extends DataClass
    implements Insertable<HousePaymentsTableData> {
  final String onlineid;
  final String? phone_number;
  final String? payment_reason;
  final String? payment_method;
  final String? amount;
  final String? payment_description;
  final String? transaction_date;
  HousePaymentsTableData(
      {required this.onlineid,
      this.phone_number,
      this.payment_reason,
      this.payment_method,
      this.amount,
      this.payment_description,
      this.transaction_date});
  factory HousePaymentsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HousePaymentsTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      phone_number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      payment_reason: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_reason']),
      payment_method: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_method']),
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      payment_description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}payment_description']),
      transaction_date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || phone_number != null) {
      map['phone_number'] = Variable<String?>(phone_number);
    }
    if (!nullToAbsent || payment_reason != null) {
      map['payment_reason'] = Variable<String?>(payment_reason);
    }
    if (!nullToAbsent || payment_method != null) {
      map['payment_method'] = Variable<String?>(payment_method);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String?>(amount);
    }
    if (!nullToAbsent || payment_description != null) {
      map['payment_description'] = Variable<String?>(payment_description);
    }
    if (!nullToAbsent || transaction_date != null) {
      map['transaction_date'] = Variable<String?>(transaction_date);
    }
    return map;
  }

  HousePaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return HousePaymentsTableCompanion(
      onlineid: Value(onlineid),
      phone_number: phone_number == null && nullToAbsent
          ? const Value.absent()
          : Value(phone_number),
      payment_reason: payment_reason == null && nullToAbsent
          ? const Value.absent()
          : Value(payment_reason),
      payment_method: payment_method == null && nullToAbsent
          ? const Value.absent()
          : Value(payment_method),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      payment_description: payment_description == null && nullToAbsent
          ? const Value.absent()
          : Value(payment_description),
      transaction_date: transaction_date == null && nullToAbsent
          ? const Value.absent()
          : Value(transaction_date),
    );
  }

  factory HousePaymentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HousePaymentsTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      phone_number: serializer.fromJson<String?>(json['phone_number']),
      payment_reason: serializer.fromJson<String?>(json['payment_reason']),
      payment_method: serializer.fromJson<String?>(json['payment_method']),
      amount: serializer.fromJson<String?>(json['amount']),
      payment_description:
          serializer.fromJson<String?>(json['payment_description']),
      transaction_date: serializer.fromJson<String?>(json['transaction_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'phone_number': serializer.toJson<String?>(phone_number),
      'payment_reason': serializer.toJson<String?>(payment_reason),
      'payment_method': serializer.toJson<String?>(payment_method),
      'amount': serializer.toJson<String?>(amount),
      'payment_description': serializer.toJson<String?>(payment_description),
      'transaction_date': serializer.toJson<String?>(transaction_date),
    };
  }

  HousePaymentsTableData copyWith(
          {String? onlineid,
          String? phone_number,
          String? payment_reason,
          String? payment_method,
          String? amount,
          String? payment_description,
          String? transaction_date}) =>
      HousePaymentsTableData(
        onlineid: onlineid ?? this.onlineid,
        phone_number: phone_number ?? this.phone_number,
        payment_reason: payment_reason ?? this.payment_reason,
        payment_method: payment_method ?? this.payment_method,
        amount: amount ?? this.amount,
        payment_description: payment_description ?? this.payment_description,
        transaction_date: transaction_date ?? this.transaction_date,
      );
  @override
  String toString() {
    return (StringBuffer('HousePaymentsTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('phone_number: $phone_number, ')
          ..write('payment_reason: $payment_reason, ')
          ..write('payment_method: $payment_method, ')
          ..write('amount: $amount, ')
          ..write('payment_description: $payment_description, ')
          ..write('transaction_date: $transaction_date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          phone_number.hashCode,
          $mrjc(
              payment_reason.hashCode,
              $mrjc(
                  payment_method.hashCode,
                  $mrjc(
                      amount.hashCode,
                      $mrjc(payment_description.hashCode,
                          transaction_date.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HousePaymentsTableData &&
          other.onlineid == this.onlineid &&
          other.phone_number == this.phone_number &&
          other.payment_reason == this.payment_reason &&
          other.payment_method == this.payment_method &&
          other.amount == this.amount &&
          other.payment_description == this.payment_description &&
          other.transaction_date == this.transaction_date);
}

class HousePaymentsTableCompanion
    extends UpdateCompanion<HousePaymentsTableData> {
  final Value<String> onlineid;
  final Value<String?> phone_number;
  final Value<String?> payment_reason;
  final Value<String?> payment_method;
  final Value<String?> amount;
  final Value<String?> payment_description;
  final Value<String?> transaction_date;
  const HousePaymentsTableCompanion({
    this.onlineid = const Value.absent(),
    this.phone_number = const Value.absent(),
    this.payment_reason = const Value.absent(),
    this.payment_method = const Value.absent(),
    this.amount = const Value.absent(),
    this.payment_description = const Value.absent(),
    this.transaction_date = const Value.absent(),
  });
  HousePaymentsTableCompanion.insert({
    required String onlineid,
    this.phone_number = const Value.absent(),
    this.payment_reason = const Value.absent(),
    this.payment_method = const Value.absent(),
    this.amount = const Value.absent(),
    this.payment_description = const Value.absent(),
    this.transaction_date = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<HousePaymentsTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? phone_number,
    Expression<String?>? payment_reason,
    Expression<String?>? payment_method,
    Expression<String?>? amount,
    Expression<String?>? payment_description,
    Expression<String?>? transaction_date,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (phone_number != null) 'phone_number': phone_number,
      if (payment_reason != null) 'payment_reason': payment_reason,
      if (payment_method != null) 'payment_method': payment_method,
      if (amount != null) 'amount': amount,
      if (payment_description != null)
        'payment_description': payment_description,
      if (transaction_date != null) 'transaction_date': transaction_date,
    });
  }

  HousePaymentsTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? phone_number,
      Value<String?>? payment_reason,
      Value<String?>? payment_method,
      Value<String?>? amount,
      Value<String?>? payment_description,
      Value<String?>? transaction_date}) {
    return HousePaymentsTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      phone_number: phone_number ?? this.phone_number,
      payment_reason: payment_reason ?? this.payment_reason,
      payment_method: payment_method ?? this.payment_method,
      amount: amount ?? this.amount,
      payment_description: payment_description ?? this.payment_description,
      transaction_date: transaction_date ?? this.transaction_date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (phone_number.present) {
      map['phone_number'] = Variable<String?>(phone_number.value);
    }
    if (payment_reason.present) {
      map['payment_reason'] = Variable<String?>(payment_reason.value);
    }
    if (payment_method.present) {
      map['payment_method'] = Variable<String?>(payment_method.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String?>(amount.value);
    }
    if (payment_description.present) {
      map['payment_description'] = Variable<String?>(payment_description.value);
    }
    if (transaction_date.present) {
      map['transaction_date'] = Variable<String?>(transaction_date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HousePaymentsTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('phone_number: $phone_number, ')
          ..write('payment_reason: $payment_reason, ')
          ..write('payment_method: $payment_method, ')
          ..write('amount: $amount, ')
          ..write('payment_description: $payment_description, ')
          ..write('transaction_date: $transaction_date')
          ..write(')'))
        .toString();
  }
}

class $HousePaymentsTableTable extends HousePaymentsTable
    with TableInfo<$HousePaymentsTableTable, HousePaymentsTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $HousePaymentsTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phone_numberMeta =
      const VerificationMeta('phone_number');
  @override
  late final GeneratedTextColumn phone_number = _constructPhoneNumber();
  GeneratedTextColumn _constructPhoneNumber() {
    return GeneratedTextColumn(
      'phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _payment_reasonMeta =
      const VerificationMeta('payment_reason');
  @override
  late final GeneratedTextColumn payment_reason = _constructPaymentReason();
  GeneratedTextColumn _constructPaymentReason() {
    return GeneratedTextColumn(
      'payment_reason',
      $tableName,
      true,
    );
  }

  final VerificationMeta _payment_methodMeta =
      const VerificationMeta('payment_method');
  @override
  late final GeneratedTextColumn payment_method = _constructPaymentMethod();
  GeneratedTextColumn _constructPaymentMethod() {
    return GeneratedTextColumn(
      'payment_method',
      $tableName,
      true,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _payment_descriptionMeta =
      const VerificationMeta('payment_description');
  @override
  late final GeneratedTextColumn payment_description =
      _constructPaymentDescription();
  GeneratedTextColumn _constructPaymentDescription() {
    return GeneratedTextColumn(
      'payment_description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _transaction_dateMeta =
      const VerificationMeta('transaction_date');
  @override
  late final GeneratedTextColumn transaction_date = _constructTransactionDate();
  GeneratedTextColumn _constructTransactionDate() {
    return GeneratedTextColumn(
      'transaction_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        onlineid,
        phone_number,
        payment_reason,
        payment_method,
        amount,
        payment_description,
        transaction_date
      ];
  @override
  $HousePaymentsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'house_payments_table';
  @override
  final String actualTableName = 'house_payments_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HousePaymentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phone_numberMeta,
          phone_number.isAcceptableOrUnknown(
              data['phone_number']!, _phone_numberMeta));
    }
    if (data.containsKey('payment_reason')) {
      context.handle(
          _payment_reasonMeta,
          payment_reason.isAcceptableOrUnknown(
              data['payment_reason']!, _payment_reasonMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _payment_methodMeta,
          payment_method.isAcceptableOrUnknown(
              data['payment_method']!, _payment_methodMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('payment_description')) {
      context.handle(
          _payment_descriptionMeta,
          payment_description.isAcceptableOrUnknown(
              data['payment_description']!, _payment_descriptionMeta));
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transaction_dateMeta,
          transaction_date.isAcceptableOrUnknown(
              data['transaction_date']!, _transaction_dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  HousePaymentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HousePaymentsTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HousePaymentsTableTable createAlias(String alias) {
    return $HousePaymentsTableTable(_db, alias);
  }
}

class FixedBillsTableData extends DataClass
    implements Insertable<FixedBillsTableData> {
  final String onlineid;
  final String? name;
  final String? deposit;
  final String? amount;
  final String? payment_frequency;
  final String? unit;
  FixedBillsTableData(
      {required this.onlineid,
      this.name,
      this.deposit,
      this.amount,
      this.payment_frequency,
      this.unit});
  factory FixedBillsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FixedBillsTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      deposit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit']),
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      payment_frequency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_frequency']),
      unit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || deposit != null) {
      map['deposit'] = Variable<String?>(deposit);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String?>(amount);
    }
    if (!nullToAbsent || payment_frequency != null) {
      map['payment_frequency'] = Variable<String?>(payment_frequency);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String?>(unit);
    }
    return map;
  }

  FixedBillsTableCompanion toCompanion(bool nullToAbsent) {
    return FixedBillsTableCompanion(
      onlineid: Value(onlineid),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      deposit: deposit == null && nullToAbsent
          ? const Value.absent()
          : Value(deposit),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      payment_frequency: payment_frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(payment_frequency),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
    );
  }

  factory FixedBillsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FixedBillsTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      name: serializer.fromJson<String?>(json['name']),
      deposit: serializer.fromJson<String?>(json['deposit']),
      amount: serializer.fromJson<String?>(json['amount']),
      payment_frequency:
          serializer.fromJson<String?>(json['payment_frequency']),
      unit: serializer.fromJson<String?>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'name': serializer.toJson<String?>(name),
      'deposit': serializer.toJson<String?>(deposit),
      'amount': serializer.toJson<String?>(amount),
      'payment_frequency': serializer.toJson<String?>(payment_frequency),
      'unit': serializer.toJson<String?>(unit),
    };
  }

  FixedBillsTableData copyWith(
          {String? onlineid,
          String? name,
          String? deposit,
          String? amount,
          String? payment_frequency,
          String? unit}) =>
      FixedBillsTableData(
        onlineid: onlineid ?? this.onlineid,
        name: name ?? this.name,
        deposit: deposit ?? this.deposit,
        amount: amount ?? this.amount,
        payment_frequency: payment_frequency ?? this.payment_frequency,
        unit: unit ?? this.unit,
      );
  @override
  String toString() {
    return (StringBuffer('FixedBillsTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('name: $name, ')
          ..write('deposit: $deposit, ')
          ..write('amount: $amount, ')
          ..write('payment_frequency: $payment_frequency, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              deposit.hashCode,
              $mrjc(amount.hashCode,
                  $mrjc(payment_frequency.hashCode, unit.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FixedBillsTableData &&
          other.onlineid == this.onlineid &&
          other.name == this.name &&
          other.deposit == this.deposit &&
          other.amount == this.amount &&
          other.payment_frequency == this.payment_frequency &&
          other.unit == this.unit);
}

class FixedBillsTableCompanion extends UpdateCompanion<FixedBillsTableData> {
  final Value<String> onlineid;
  final Value<String?> name;
  final Value<String?> deposit;
  final Value<String?> amount;
  final Value<String?> payment_frequency;
  final Value<String?> unit;
  const FixedBillsTableCompanion({
    this.onlineid = const Value.absent(),
    this.name = const Value.absent(),
    this.deposit = const Value.absent(),
    this.amount = const Value.absent(),
    this.payment_frequency = const Value.absent(),
    this.unit = const Value.absent(),
  });
  FixedBillsTableCompanion.insert({
    required String onlineid,
    this.name = const Value.absent(),
    this.deposit = const Value.absent(),
    this.amount = const Value.absent(),
    this.payment_frequency = const Value.absent(),
    this.unit = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<FixedBillsTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? name,
    Expression<String?>? deposit,
    Expression<String?>? amount,
    Expression<String?>? payment_frequency,
    Expression<String?>? unit,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (name != null) 'name': name,
      if (deposit != null) 'deposit': deposit,
      if (amount != null) 'amount': amount,
      if (payment_frequency != null) 'payment_frequency': payment_frequency,
      if (unit != null) 'unit': unit,
    });
  }

  FixedBillsTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? name,
      Value<String?>? deposit,
      Value<String?>? amount,
      Value<String?>? payment_frequency,
      Value<String?>? unit}) {
    return FixedBillsTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      name: name ?? this.name,
      deposit: deposit ?? this.deposit,
      amount: amount ?? this.amount,
      payment_frequency: payment_frequency ?? this.payment_frequency,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<String?>(deposit.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String?>(amount.value);
    }
    if (payment_frequency.present) {
      map['payment_frequency'] = Variable<String?>(payment_frequency.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String?>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FixedBillsTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('name: $name, ')
          ..write('deposit: $deposit, ')
          ..write('amount: $amount, ')
          ..write('payment_frequency: $payment_frequency, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $FixedBillsTableTable extends FixedBillsTable
    with TableInfo<$FixedBillsTableTable, FixedBillsTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FixedBillsTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _depositMeta = const VerificationMeta('deposit');
  @override
  late final GeneratedTextColumn deposit = _constructDeposit();
  GeneratedTextColumn _constructDeposit() {
    return GeneratedTextColumn(
      'deposit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn(
      'amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _payment_frequencyMeta =
      const VerificationMeta('payment_frequency');
  @override
  late final GeneratedTextColumn payment_frequency =
      _constructPaymentFrequency();
  GeneratedTextColumn _constructPaymentFrequency() {
    return GeneratedTextColumn(
      'payment_frequency',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedTextColumn unit = _constructUnit();
  GeneratedTextColumn _constructUnit() {
    return GeneratedTextColumn(
      'unit',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [onlineid, name, deposit, amount, payment_frequency, unit];
  @override
  $FixedBillsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'fixed_bills_table';
  @override
  final String actualTableName = 'fixed_bills_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FixedBillsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('payment_frequency')) {
      context.handle(
          _payment_frequencyMeta,
          payment_frequency.isAcceptableOrUnknown(
              data['payment_frequency']!, _payment_frequencyMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  FixedBillsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FixedBillsTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FixedBillsTableTable createAlias(String alias) {
    return $FixedBillsTableTable(_db, alias);
  }
}

class VariableBillsTableData extends DataClass
    implements Insertable<VariableBillsTableData> {
  final String onlineid;
  final String? bill_name;
  final String? amount_per_unit;
  final String? number_of_units;
  final String? payment_status;
  final String? read_on;
  VariableBillsTableData(
      {required this.onlineid,
      this.bill_name,
      this.amount_per_unit,
      this.number_of_units,
      this.payment_status,
      this.read_on});
  factory VariableBillsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return VariableBillsTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      bill_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bill_name']),
      amount_per_unit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount_per_unit']),
      number_of_units: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number_of_units']),
      payment_status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_status']),
      read_on: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read_on']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || bill_name != null) {
      map['bill_name'] = Variable<String?>(bill_name);
    }
    if (!nullToAbsent || amount_per_unit != null) {
      map['amount_per_unit'] = Variable<String?>(amount_per_unit);
    }
    if (!nullToAbsent || number_of_units != null) {
      map['number_of_units'] = Variable<String?>(number_of_units);
    }
    if (!nullToAbsent || payment_status != null) {
      map['payment_status'] = Variable<String?>(payment_status);
    }
    if (!nullToAbsent || read_on != null) {
      map['read_on'] = Variable<String?>(read_on);
    }
    return map;
  }

  VariableBillsTableCompanion toCompanion(bool nullToAbsent) {
    return VariableBillsTableCompanion(
      onlineid: Value(onlineid),
      bill_name: bill_name == null && nullToAbsent
          ? const Value.absent()
          : Value(bill_name),
      amount_per_unit: amount_per_unit == null && nullToAbsent
          ? const Value.absent()
          : Value(amount_per_unit),
      number_of_units: number_of_units == null && nullToAbsent
          ? const Value.absent()
          : Value(number_of_units),
      payment_status: payment_status == null && nullToAbsent
          ? const Value.absent()
          : Value(payment_status),
      read_on: read_on == null && nullToAbsent
          ? const Value.absent()
          : Value(read_on),
    );
  }

  factory VariableBillsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return VariableBillsTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      bill_name: serializer.fromJson<String?>(json['bill_name']),
      amount_per_unit: serializer.fromJson<String?>(json['amount_per_unit']),
      number_of_units: serializer.fromJson<String?>(json['number_of_units']),
      payment_status: serializer.fromJson<String?>(json['payment_status']),
      read_on: serializer.fromJson<String?>(json['read_on']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'bill_name': serializer.toJson<String?>(bill_name),
      'amount_per_unit': serializer.toJson<String?>(amount_per_unit),
      'number_of_units': serializer.toJson<String?>(number_of_units),
      'payment_status': serializer.toJson<String?>(payment_status),
      'read_on': serializer.toJson<String?>(read_on),
    };
  }

  VariableBillsTableData copyWith(
          {String? onlineid,
          String? bill_name,
          String? amount_per_unit,
          String? number_of_units,
          String? payment_status,
          String? read_on}) =>
      VariableBillsTableData(
        onlineid: onlineid ?? this.onlineid,
        bill_name: bill_name ?? this.bill_name,
        amount_per_unit: amount_per_unit ?? this.amount_per_unit,
        number_of_units: number_of_units ?? this.number_of_units,
        payment_status: payment_status ?? this.payment_status,
        read_on: read_on ?? this.read_on,
      );
  @override
  String toString() {
    return (StringBuffer('VariableBillsTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('bill_name: $bill_name, ')
          ..write('amount_per_unit: $amount_per_unit, ')
          ..write('number_of_units: $number_of_units, ')
          ..write('payment_status: $payment_status, ')
          ..write('read_on: $read_on')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          bill_name.hashCode,
          $mrjc(
              amount_per_unit.hashCode,
              $mrjc(number_of_units.hashCode,
                  $mrjc(payment_status.hashCode, read_on.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VariableBillsTableData &&
          other.onlineid == this.onlineid &&
          other.bill_name == this.bill_name &&
          other.amount_per_unit == this.amount_per_unit &&
          other.number_of_units == this.number_of_units &&
          other.payment_status == this.payment_status &&
          other.read_on == this.read_on);
}

class VariableBillsTableCompanion
    extends UpdateCompanion<VariableBillsTableData> {
  final Value<String> onlineid;
  final Value<String?> bill_name;
  final Value<String?> amount_per_unit;
  final Value<String?> number_of_units;
  final Value<String?> payment_status;
  final Value<String?> read_on;
  const VariableBillsTableCompanion({
    this.onlineid = const Value.absent(),
    this.bill_name = const Value.absent(),
    this.amount_per_unit = const Value.absent(),
    this.number_of_units = const Value.absent(),
    this.payment_status = const Value.absent(),
    this.read_on = const Value.absent(),
  });
  VariableBillsTableCompanion.insert({
    required String onlineid,
    this.bill_name = const Value.absent(),
    this.amount_per_unit = const Value.absent(),
    this.number_of_units = const Value.absent(),
    this.payment_status = const Value.absent(),
    this.read_on = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<VariableBillsTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? bill_name,
    Expression<String?>? amount_per_unit,
    Expression<String?>? number_of_units,
    Expression<String?>? payment_status,
    Expression<String?>? read_on,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (bill_name != null) 'bill_name': bill_name,
      if (amount_per_unit != null) 'amount_per_unit': amount_per_unit,
      if (number_of_units != null) 'number_of_units': number_of_units,
      if (payment_status != null) 'payment_status': payment_status,
      if (read_on != null) 'read_on': read_on,
    });
  }

  VariableBillsTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? bill_name,
      Value<String?>? amount_per_unit,
      Value<String?>? number_of_units,
      Value<String?>? payment_status,
      Value<String?>? read_on}) {
    return VariableBillsTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      bill_name: bill_name ?? this.bill_name,
      amount_per_unit: amount_per_unit ?? this.amount_per_unit,
      number_of_units: number_of_units ?? this.number_of_units,
      payment_status: payment_status ?? this.payment_status,
      read_on: read_on ?? this.read_on,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (bill_name.present) {
      map['bill_name'] = Variable<String?>(bill_name.value);
    }
    if (amount_per_unit.present) {
      map['amount_per_unit'] = Variable<String?>(amount_per_unit.value);
    }
    if (number_of_units.present) {
      map['number_of_units'] = Variable<String?>(number_of_units.value);
    }
    if (payment_status.present) {
      map['payment_status'] = Variable<String?>(payment_status.value);
    }
    if (read_on.present) {
      map['read_on'] = Variable<String?>(read_on.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VariableBillsTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('bill_name: $bill_name, ')
          ..write('amount_per_unit: $amount_per_unit, ')
          ..write('number_of_units: $number_of_units, ')
          ..write('payment_status: $payment_status, ')
          ..write('read_on: $read_on')
          ..write(')'))
        .toString();
  }
}

class $VariableBillsTableTable extends VariableBillsTable
    with TableInfo<$VariableBillsTableTable, VariableBillsTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $VariableBillsTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bill_nameMeta = const VerificationMeta('bill_name');
  @override
  late final GeneratedTextColumn bill_name = _constructBillName();
  GeneratedTextColumn _constructBillName() {
    return GeneratedTextColumn(
      'bill_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _amount_per_unitMeta =
      const VerificationMeta('amount_per_unit');
  @override
  late final GeneratedTextColumn amount_per_unit = _constructAmountPerUnit();
  GeneratedTextColumn _constructAmountPerUnit() {
    return GeneratedTextColumn(
      'amount_per_unit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _number_of_unitsMeta =
      const VerificationMeta('number_of_units');
  @override
  late final GeneratedTextColumn number_of_units = _constructNumberOfUnits();
  GeneratedTextColumn _constructNumberOfUnits() {
    return GeneratedTextColumn(
      'number_of_units',
      $tableName,
      true,
    );
  }

  final VerificationMeta _payment_statusMeta =
      const VerificationMeta('payment_status');
  @override
  late final GeneratedTextColumn payment_status = _constructPaymentStatus();
  GeneratedTextColumn _constructPaymentStatus() {
    return GeneratedTextColumn(
      'payment_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _read_onMeta = const VerificationMeta('read_on');
  @override
  late final GeneratedTextColumn read_on = _constructReadOn();
  GeneratedTextColumn _constructReadOn() {
    return GeneratedTextColumn(
      'read_on',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        onlineid,
        bill_name,
        amount_per_unit,
        number_of_units,
        payment_status,
        read_on
      ];
  @override
  $VariableBillsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'variable_bills_table';
  @override
  final String actualTableName = 'variable_bills_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<VariableBillsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('bill_name')) {
      context.handle(_bill_nameMeta,
          bill_name.isAcceptableOrUnknown(data['bill_name']!, _bill_nameMeta));
    }
    if (data.containsKey('amount_per_unit')) {
      context.handle(
          _amount_per_unitMeta,
          amount_per_unit.isAcceptableOrUnknown(
              data['amount_per_unit']!, _amount_per_unitMeta));
    }
    if (data.containsKey('number_of_units')) {
      context.handle(
          _number_of_unitsMeta,
          number_of_units.isAcceptableOrUnknown(
              data['number_of_units']!, _number_of_unitsMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _payment_statusMeta,
          payment_status.isAcceptableOrUnknown(
              data['payment_status']!, _payment_statusMeta));
    }
    if (data.containsKey('read_on')) {
      context.handle(_read_onMeta,
          read_on.isAcceptableOrUnknown(data['read_on']!, _read_onMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  VariableBillsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return VariableBillsTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VariableBillsTableTable createAlias(String alias) {
    return $VariableBillsTableTable(_db, alias);
  }
}

class TenantUnitTableData extends DataClass
    implements Insertable<TenantUnitTableData> {
  final String onlineid;
  final String? unit_price;
  final String? label;
  final String? building_name;
  final String? unit_deposit;
  final String? entry_date;
  final String? unit_type_name;
  TenantUnitTableData(
      {required this.onlineid,
      this.unit_price,
      this.label,
      this.building_name,
      this.unit_deposit,
      this.entry_date,
      this.unit_type_name});
  factory TenantUnitTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TenantUnitTableData(
      onlineid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}onlineid'])!,
      unit_price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_price']),
      label: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}label']),
      building_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}building_name']),
      unit_deposit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_deposit']),
      entry_date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_date']),
      unit_type_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_type_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['onlineid'] = Variable<String>(onlineid);
    if (!nullToAbsent || unit_price != null) {
      map['unit_price'] = Variable<String?>(unit_price);
    }
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String?>(label);
    }
    if (!nullToAbsent || building_name != null) {
      map['building_name'] = Variable<String?>(building_name);
    }
    if (!nullToAbsent || unit_deposit != null) {
      map['unit_deposit'] = Variable<String?>(unit_deposit);
    }
    if (!nullToAbsent || entry_date != null) {
      map['entry_date'] = Variable<String?>(entry_date);
    }
    if (!nullToAbsent || unit_type_name != null) {
      map['unit_type_name'] = Variable<String?>(unit_type_name);
    }
    return map;
  }

  TenantUnitTableCompanion toCompanion(bool nullToAbsent) {
    return TenantUnitTableCompanion(
      onlineid: Value(onlineid),
      unit_price: unit_price == null && nullToAbsent
          ? const Value.absent()
          : Value(unit_price),
      label:
          label == null && nullToAbsent ? const Value.absent() : Value(label),
      building_name: building_name == null && nullToAbsent
          ? const Value.absent()
          : Value(building_name),
      unit_deposit: unit_deposit == null && nullToAbsent
          ? const Value.absent()
          : Value(unit_deposit),
      entry_date: entry_date == null && nullToAbsent
          ? const Value.absent()
          : Value(entry_date),
      unit_type_name: unit_type_name == null && nullToAbsent
          ? const Value.absent()
          : Value(unit_type_name),
    );
  }

  factory TenantUnitTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TenantUnitTableData(
      onlineid: serializer.fromJson<String>(json['onlineid']),
      unit_price: serializer.fromJson<String?>(json['unit_price']),
      label: serializer.fromJson<String?>(json['label']),
      building_name: serializer.fromJson<String?>(json['building_name']),
      unit_deposit: serializer.fromJson<String?>(json['unit_deposit']),
      entry_date: serializer.fromJson<String?>(json['entry_date']),
      unit_type_name: serializer.fromJson<String?>(json['unit_type_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'onlineid': serializer.toJson<String>(onlineid),
      'unit_price': serializer.toJson<String?>(unit_price),
      'label': serializer.toJson<String?>(label),
      'building_name': serializer.toJson<String?>(building_name),
      'unit_deposit': serializer.toJson<String?>(unit_deposit),
      'entry_date': serializer.toJson<String?>(entry_date),
      'unit_type_name': serializer.toJson<String?>(unit_type_name),
    };
  }

  TenantUnitTableData copyWith(
          {String? onlineid,
          String? unit_price,
          String? label,
          String? building_name,
          String? unit_deposit,
          String? entry_date,
          String? unit_type_name}) =>
      TenantUnitTableData(
        onlineid: onlineid ?? this.onlineid,
        unit_price: unit_price ?? this.unit_price,
        label: label ?? this.label,
        building_name: building_name ?? this.building_name,
        unit_deposit: unit_deposit ?? this.unit_deposit,
        entry_date: entry_date ?? this.entry_date,
        unit_type_name: unit_type_name ?? this.unit_type_name,
      );
  @override
  String toString() {
    return (StringBuffer('TenantUnitTableData(')
          ..write('onlineid: $onlineid, ')
          ..write('unit_price: $unit_price, ')
          ..write('label: $label, ')
          ..write('building_name: $building_name, ')
          ..write('unit_deposit: $unit_deposit, ')
          ..write('entry_date: $entry_date, ')
          ..write('unit_type_name: $unit_type_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      onlineid.hashCode,
      $mrjc(
          unit_price.hashCode,
          $mrjc(
              label.hashCode,
              $mrjc(
                  building_name.hashCode,
                  $mrjc(unit_deposit.hashCode,
                      $mrjc(entry_date.hashCode, unit_type_name.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantUnitTableData &&
          other.onlineid == this.onlineid &&
          other.unit_price == this.unit_price &&
          other.label == this.label &&
          other.building_name == this.building_name &&
          other.unit_deposit == this.unit_deposit &&
          other.entry_date == this.entry_date &&
          other.unit_type_name == this.unit_type_name);
}

class TenantUnitTableCompanion extends UpdateCompanion<TenantUnitTableData> {
  final Value<String> onlineid;
  final Value<String?> unit_price;
  final Value<String?> label;
  final Value<String?> building_name;
  final Value<String?> unit_deposit;
  final Value<String?> entry_date;
  final Value<String?> unit_type_name;
  const TenantUnitTableCompanion({
    this.onlineid = const Value.absent(),
    this.unit_price = const Value.absent(),
    this.label = const Value.absent(),
    this.building_name = const Value.absent(),
    this.unit_deposit = const Value.absent(),
    this.entry_date = const Value.absent(),
    this.unit_type_name = const Value.absent(),
  });
  TenantUnitTableCompanion.insert({
    required String onlineid,
    this.unit_price = const Value.absent(),
    this.label = const Value.absent(),
    this.building_name = const Value.absent(),
    this.unit_deposit = const Value.absent(),
    this.entry_date = const Value.absent(),
    this.unit_type_name = const Value.absent(),
  }) : onlineid = Value(onlineid);
  static Insertable<TenantUnitTableData> custom({
    Expression<String>? onlineid,
    Expression<String?>? unit_price,
    Expression<String?>? label,
    Expression<String?>? building_name,
    Expression<String?>? unit_deposit,
    Expression<String?>? entry_date,
    Expression<String?>? unit_type_name,
  }) {
    return RawValuesInsertable({
      if (onlineid != null) 'onlineid': onlineid,
      if (unit_price != null) 'unit_price': unit_price,
      if (label != null) 'label': label,
      if (building_name != null) 'building_name': building_name,
      if (unit_deposit != null) 'unit_deposit': unit_deposit,
      if (entry_date != null) 'entry_date': entry_date,
      if (unit_type_name != null) 'unit_type_name': unit_type_name,
    });
  }

  TenantUnitTableCompanion copyWith(
      {Value<String>? onlineid,
      Value<String?>? unit_price,
      Value<String?>? label,
      Value<String?>? building_name,
      Value<String?>? unit_deposit,
      Value<String?>? entry_date,
      Value<String?>? unit_type_name}) {
    return TenantUnitTableCompanion(
      onlineid: onlineid ?? this.onlineid,
      unit_price: unit_price ?? this.unit_price,
      label: label ?? this.label,
      building_name: building_name ?? this.building_name,
      unit_deposit: unit_deposit ?? this.unit_deposit,
      entry_date: entry_date ?? this.entry_date,
      unit_type_name: unit_type_name ?? this.unit_type_name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (onlineid.present) {
      map['onlineid'] = Variable<String>(onlineid.value);
    }
    if (unit_price.present) {
      map['unit_price'] = Variable<String?>(unit_price.value);
    }
    if (label.present) {
      map['label'] = Variable<String?>(label.value);
    }
    if (building_name.present) {
      map['building_name'] = Variable<String?>(building_name.value);
    }
    if (unit_deposit.present) {
      map['unit_deposit'] = Variable<String?>(unit_deposit.value);
    }
    if (entry_date.present) {
      map['entry_date'] = Variable<String?>(entry_date.value);
    }
    if (unit_type_name.present) {
      map['unit_type_name'] = Variable<String?>(unit_type_name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantUnitTableCompanion(')
          ..write('onlineid: $onlineid, ')
          ..write('unit_price: $unit_price, ')
          ..write('label: $label, ')
          ..write('building_name: $building_name, ')
          ..write('unit_deposit: $unit_deposit, ')
          ..write('entry_date: $entry_date, ')
          ..write('unit_type_name: $unit_type_name')
          ..write(')'))
        .toString();
  }
}

class $TenantUnitTableTable extends TenantUnitTable
    with TableInfo<$TenantUnitTableTable, TenantUnitTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TenantUnitTableTable(this._db, [this._alias]);
  final VerificationMeta _onlineidMeta = const VerificationMeta('onlineid');
  @override
  late final GeneratedTextColumn onlineid = _constructOnlineid();
  GeneratedTextColumn _constructOnlineid() {
    return GeneratedTextColumn(
      'onlineid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unit_priceMeta = const VerificationMeta('unit_price');
  @override
  late final GeneratedTextColumn unit_price = _constructUnitPrice();
  GeneratedTextColumn _constructUnitPrice() {
    return GeneratedTextColumn(
      'unit_price',
      $tableName,
      true,
    );
  }

  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedTextColumn label = _constructLabel();
  GeneratedTextColumn _constructLabel() {
    return GeneratedTextColumn(
      'label',
      $tableName,
      true,
    );
  }

  final VerificationMeta _building_nameMeta =
      const VerificationMeta('building_name');
  @override
  late final GeneratedTextColumn building_name = _constructBuildingName();
  GeneratedTextColumn _constructBuildingName() {
    return GeneratedTextColumn(
      'building_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unit_depositMeta =
      const VerificationMeta('unit_deposit');
  @override
  late final GeneratedTextColumn unit_deposit = _constructUnitDeposit();
  GeneratedTextColumn _constructUnitDeposit() {
    return GeneratedTextColumn(
      'unit_deposit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _entry_dateMeta = const VerificationMeta('entry_date');
  @override
  late final GeneratedTextColumn entry_date = _constructEntryDate();
  GeneratedTextColumn _constructEntryDate() {
    return GeneratedTextColumn(
      'entry_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unit_type_nameMeta =
      const VerificationMeta('unit_type_name');
  @override
  late final GeneratedTextColumn unit_type_name = _constructUnitTypeName();
  GeneratedTextColumn _constructUnitTypeName() {
    return GeneratedTextColumn(
      'unit_type_name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        onlineid,
        unit_price,
        label,
        building_name,
        unit_deposit,
        entry_date,
        unit_type_name
      ];
  @override
  $TenantUnitTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tenant_unit_table';
  @override
  final String actualTableName = 'tenant_unit_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TenantUnitTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('onlineid')) {
      context.handle(_onlineidMeta,
          onlineid.isAcceptableOrUnknown(data['onlineid']!, _onlineidMeta));
    } else if (isInserting) {
      context.missing(_onlineidMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
          _unit_priceMeta,
          unit_price.isAcceptableOrUnknown(
              data['unit_price']!, _unit_priceMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('building_name')) {
      context.handle(
          _building_nameMeta,
          building_name.isAcceptableOrUnknown(
              data['building_name']!, _building_nameMeta));
    }
    if (data.containsKey('unit_deposit')) {
      context.handle(
          _unit_depositMeta,
          unit_deposit.isAcceptableOrUnknown(
              data['unit_deposit']!, _unit_depositMeta));
    }
    if (data.containsKey('entry_date')) {
      context.handle(
          _entry_dateMeta,
          entry_date.isAcceptableOrUnknown(
              data['entry_date']!, _entry_dateMeta));
    }
    if (data.containsKey('unit_type_name')) {
      context.handle(
          _unit_type_nameMeta,
          unit_type_name.isAcceptableOrUnknown(
              data['unit_type_name']!, _unit_type_nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {onlineid};
  @override
  TenantUnitTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TenantUnitTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TenantUnitTableTable createAlias(String alias) {
    return $TenantUnitTableTable(_db, alias);
  }
}

abstract class _$DatabaseHelper extends GeneratedDatabase {
  _$DatabaseHelper(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MyApartmentTableTable myApartmentTable =
      $MyApartmentTableTable(this);
  late final $MyHouseDetailsTable myHouseDetails = $MyHouseDetailsTable(this);
  late final $MyHouseArrearsTable myHouseArrears = $MyHouseArrearsTable(this);
  late final $MyHousePaymentsTable myHousePayments =
      $MyHousePaymentsTable(this);
  late final $ContactsTable contacts = $ContactsTable(this);
  late final $OfflineActivityTable offlineActivity =
      $OfflineActivityTable(this);
  late final $TransactionsTableTable transactionsTable =
      $TransactionsTableTable(this);
  late final $BillerTableTable billerTable = $BillerTableTable(this);
  late final $BuildingUnitTableTable buildingUnitTable =
      $BuildingUnitTableTable(this);
  late final $HousePaymentsTableTable housePaymentsTable =
      $HousePaymentsTableTable(this);
  late final $FixedBillsTableTable fixedBillsTable =
      $FixedBillsTableTable(this);
  late final $VariableBillsTableTable variableBillsTable =
      $VariableBillsTableTable(this);
  late final $TenantUnitTableTable tenantUnitTable =
      $TenantUnitTableTable(this);
  late final DatabaseDao databaseDao = DatabaseDao(this as DatabaseHelper);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        myApartmentTable,
        myHouseDetails,
        myHouseArrears,
        myHousePayments,
        contacts,
        offlineActivity,
        transactionsTable,
        billerTable,
        buildingUnitTable,
        housePaymentsTable,
        fixedBillsTable,
        variableBillsTable,
        tenantUnitTable
      ];
}
