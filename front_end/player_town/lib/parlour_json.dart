import 'package:json_annotation/json_annotation.dart';

/// This allows the `ParlourJSON` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'parlour_json.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class ParlourJSON {
  ParlourJSON(this.p_details, this.o_details, this.locationJSON, this.gps,
      this.boards, this.tags);

  ParlourDetailsJSON p_details;
  OwnerDetailsJSON o_details;
  LocationJSON locationJSON;
  GPSJSON gps;
  List<BoardJSON> boards;
  TagsJSON tags;

  /// A necessary factory constructor for creating a new ParlourJSON instance
  /// from a map. Pass the map to the generated `_$ParlourFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ParlourJSON.
  factory ParlourJSON.fromJson(Map<String, dynamic> json) =>
      _$ParlourJSONFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ParlourToJson`.
  Map<String, dynamic> toJson() => _$ParlourJSONToJson(this);
}

@JsonSerializable()
class ParlourDetailsJSON {
  ParlourDetailsJSON(
      this.parlourName, this.description, this.pmailId, this.phoneNo);

  String parlourName;
  String description;
  String pmailId;
  String phoneNo;

  factory ParlourDetailsJSON.fromJson(Map<String, dynamic> json) =>
      _$ParlourDetailsJSONFromJson(json);

  Map<String, dynamic> toJson() => _$ParlourDetailsJSONToJson(this);
}

@JsonSerializable()
class OwnerDetailsJSON {
  OwnerDetailsJSON(this.firstName, this.lastName, this.oemail, this.phoneNo);

  String firstName;
  String lastName;
  String oemail;
  String phoneNo;

  factory OwnerDetailsJSON.fromJson(Map<String, dynamic> json) =>
      _$OwnerDetailsJSONFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerDetailsJSONToJson(this);
}

@JsonSerializable()
class LocationJSON {
  LocationJSON(this.locationId, this.addressLine1, this.addressLine2, this.city,
      this.state, this.gps);

  int locationId;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  GPSJSON gps;

  factory LocationJSON.fromJson(Map<String, dynamic> json) =>
      _$LocationJSONFromJson(json);

  Map<String, dynamic> toJson() => _$LocationJSONToJson(this);
}

@JsonSerializable()
class GPSJSON {
  GPSJSON(this.latitude, this.longitude);

  var latitude;
  var longitude;

  factory GPSJSON.fromJson(Map<String, dynamic> json) =>
      _$GPSJSONFromJson(json);

  Map<String, dynamic> toJson() => _$GPSJSONToJson(this);
}

@JsonSerializable()
class BoardJSON {
  BoardJSON(
      this.category, this.pricePerHour, this.name, this.description, this.urls);

  int category;
  int pricePerHour;
  String name;
  String description;
  List<String> urls;

  factory BoardJSON.fromJson(Map<String, dynamic> json) =>
      _$BoardJSONFromJson(json);

  Map<String, dynamic> toJson() => _$BoardJSONToJson(this);
}

@JsonSerializable()
class TagsJSON {
  TagsJSON(this.id, this.name);

  int id;
  String name;

  factory TagsJSON.fromJson(Map<String, dynamic> json) =>
      _$TagsJSONFromJson(json);

  Map<String, dynamic> toJson() => _$TagsJSONToJson(this);
}
