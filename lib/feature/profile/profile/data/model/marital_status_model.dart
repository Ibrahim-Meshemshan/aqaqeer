import 'dart:convert';

class MaritalStatusModel {
  final List<MaritalStatusModelDatum> data;

  MaritalStatusModel({
    required this.data,
  });

  factory MaritalStatusModel.fromRawJson(String str) => MaritalStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaritalStatusModel.fromJson(Map<String, dynamic> json) => MaritalStatusModel(
    data: List<MaritalStatusModelDatum>.from(json["data"].map((x) => MaritalStatusModelDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MaritalStatusModelDatum {
    int value;
    String text;

  MaritalStatusModelDatum({
    required this.value,
    required this.text,
  });

  factory MaritalStatusModelDatum.fromRawJson(String str) => MaritalStatusModelDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaritalStatusModelDatum.fromJson(Map<String, dynamic> json) => MaritalStatusModelDatum(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}
