// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parlour_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParlourJSON _$ParlourJSONFromJson(Map<String, dynamic> json) {
  return ParlourJSON(
    json['p_details'] == null
        ? null
        : ParlourDetailsJSON.fromJson(
            json['p_details'] as Map<String, dynamic>),
    json['o_details'] == null
        ? null
        : OwnerDetailsJSON.fromJson(json['o_details'] as Map<String, dynamic>),
    json['locationJSON'] == null
        ? null
        : LocationJSON.fromJson(json['locationJSON'] as Map<String, dynamic>),
    (json['boards'] as List)
        ?.map((e) =>
            e == null ? null : BoardJSON.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['tags'] == null
        ? null
        : TagsJSON.fromJson(json['tags'] as Map<String, dynamic>),
  )..gps = json['gps'] == null
      ? null
      : GPSJSON.fromJson(json['gps'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ParlourJSONToJson(ParlourJSON instance) =>
    <String, dynamic>{
      'p_details': instance.p_details?.toJson(),
      'o_details': instance.o_details?.toJson(),
      'locationJSON': instance.locationJSON?.toJson(),
      'gps': instance.gps?.toJson(),
      'boards': instance.boards?.map((e) => e?.toJson())?.toList(),
      'tags': instance.tags?.toJson(),
    };

ParlourDetailsJSON _$ParlourDetailsJSONFromJson(Map<String, dynamic> json) {
  return ParlourDetailsJSON(
    json['parlourName'] as String,
    json['description'] as String,
    json['pmailId'] as String,
    json['phoneNo'] as String,
    json['startTime'] as String,
    json['endTime'] as String,
    json['boardCount'] as int,
  );
}

Map<String, dynamic> _$ParlourDetailsJSONToJson(ParlourDetailsJSON instance) =>
    <String, dynamic>{
      'parlourName': instance.parlourName,
      'description': instance.description,
      'pmailId': instance.pmailId,
      'phoneNo': instance.phoneNo,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'boardCount': instance.boardCount,
    };

OwnerDetailsJSON _$OwnerDetailsJSONFromJson(Map<String, dynamic> json) {
  return OwnerDetailsJSON(
    json['firstName'] as String,
    json['lastName'] as String,
    json['oemail'] as String,
    json['phoneNo'] as String,
  );
}

Map<String, dynamic> _$OwnerDetailsJSONToJson(OwnerDetailsJSON instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'oemail': instance.oemail,
      'phoneNo': instance.phoneNo,
    };

LocationJSON _$LocationJSONFromJson(Map<String, dynamic> json) {
  return LocationJSON(
    json['locationId'] as int,
    json['addressLine1'] as String,
    json['addressLine2'] as String,
    json['city'] as String,
    json['state'] as String,
    json['gps'] == null
        ? null
        : GPSJSON.fromJson(json['gps'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationJSONToJson(LocationJSON instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'gps': instance.gps,
    };

GPSJSON _$GPSJSONFromJson(Map<String, dynamic> json) {
  return GPSJSON(
    json['latitude'],
    json['longitude'],
  );
}

Map<String, dynamic> _$GPSJSONToJson(GPSJSON instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

BoardJSON _$BoardJSONFromJson(Map<String, dynamic> json) {
  return BoardJSON(
    json['category'] as int,
    json['pricePerHour'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['urls'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BoardJSONToJson(BoardJSON instance) => <String, dynamic>{
      'category': instance.category,
      'pricePerHour': instance.pricePerHour,
      'name': instance.name,
      'description': instance.description,
      'urls': instance.urls,
    };

TagsJSON _$TagsJSONFromJson(Map<String, dynamic> json) {
  return TagsJSON(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$TagsJSONToJson(TagsJSON instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
