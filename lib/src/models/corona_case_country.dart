class CoronaCaseCountry {
  CoronaCaseCountry({
    this.objectIdFieldName,
    this.uniqueIdField,
    this.globalIdFieldName,
    this.geometryType,
    this.spatialReference,
    this.fields,
    this.exceededTransferLimit,
    this.features,
  });

  String objectIdFieldName;
  UniqueIdField uniqueIdField;
  String globalIdFieldName;
  String geometryType;
  SpatialReference spatialReference;
  List<Field> fields;
  bool exceededTransferLimit;
  List<Feature> features;

  factory CoronaCaseCountry.fromJson(Map<String, dynamic> json) =>
      CoronaCaseCountry(
        objectIdFieldName: json["objectIdFieldName"],
        uniqueIdField: UniqueIdField.fromJson(json["uniqueIdField"]),
        globalIdFieldName: json["globalIdFieldName"],
        geometryType: json["geometryType"],
        spatialReference: SpatialReference.fromJson(json["spatialReference"]),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        exceededTransferLimit: json["exceededTransferLimit"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "objectIdFieldName": objectIdFieldName,
        "uniqueIdField": uniqueIdField.toJson(),
        "globalIdFieldName": globalIdFieldName,
        "geometryType": geometryType,
        "spatialReference": spatialReference.toJson(),
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "exceededTransferLimit": exceededTransferLimit,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  Feature({
    this.attributes,
  });

  Attributes attributes;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    this.objectid,
    this.provinceState,
    this.countryRegion,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.active,
    this.admin2,
    this.fips,
    this.combinedKey,
  });

  int objectid;
  String provinceState;
  String countryRegion;
  int lastUpdate;
  double lat;
  double long;
  int confirmed;
  int recovered;
  int deaths;
  int active;
  dynamic admin2;
  dynamic fips;
  String combinedKey;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        objectid: json["OBJECTID"],
        provinceState:
            json["Province_State"] == null ? null : json["Province_State"],
        countryRegion: json["Country_Region"],
        lastUpdate: json["Last_Update"],
        lat: json["Lat"] == null ? null : json["Lat"].toDouble(),
        long: json["Long_"] == null ? null : json["Long_"].toDouble(),
        confirmed: json["Confirmed"],
        recovered: json["Recovered"],
        deaths: json["Deaths"],
        active: json["Active"],
        admin2: json["Admin2"],
        fips: json["FIPS"],
        combinedKey: json["Combined_Key"],
      );

  Map<String, dynamic> toJson() => {
        "OBJECTID": objectid,
        "Province_State": provinceState == null ? null : provinceState,
        "Country_Region": countryRegion,
        "Last_Update": lastUpdate,
        "Lat": lat == null ? null : lat,
        "Long_": long == null ? null : long,
        "Confirmed": confirmed,
        "Recovered": recovered,
        "Deaths": deaths,
        "Active": active,
        "Admin2": admin2,
        "FIPS": fips,
        "Combined_Key": combinedKey,
      };
}

class Field {
  Field({
    this.name,
    this.type,
    this.alias,
    this.sqlType,
    this.domain,
    this.defaultValue,
    this.length,
  });

  String name;
  String type;
  String alias;
  SqlType sqlType;
  dynamic domain;
  dynamic defaultValue;
  int length;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        alias: json["alias"],
        sqlType: sqlTypeValues.map[json["sqlType"]],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
        length: json["length"] == null ? null : json["length"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "alias": alias,
        "sqlType": sqlTypeValues.reverse[sqlType],
        "domain": domain,
        "defaultValue": defaultValue,
        "length": length == null ? null : length,
      };
}

enum SqlType { SQL_TYPE_OTHER }

final sqlTypeValues = EnumValues({"sqlTypeOther": SqlType.SQL_TYPE_OTHER});

class SpatialReference {
  SpatialReference({
    this.wkid,
    this.latestWkid,
  });

  int wkid;
  int latestWkid;

  factory SpatialReference.fromJson(Map<String, dynamic> json) =>
      SpatialReference(
        wkid: json["wkid"],
        latestWkid: json["latestWkid"],
      );

  Map<String, dynamic> toJson() => {
        "wkid": wkid,
        "latestWkid": latestWkid,
      };
}

class UniqueIdField {
  UniqueIdField({
    this.name,
    this.isSystemMaintained,
  });

  String name;
  bool isSystemMaintained;

  factory UniqueIdField.fromJson(Map<String, dynamic> json) => UniqueIdField(
        name: json["name"],
        isSystemMaintained: json["isSystemMaintained"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isSystemMaintained": isSystemMaintained,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
