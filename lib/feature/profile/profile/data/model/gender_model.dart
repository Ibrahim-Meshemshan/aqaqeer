import 'dart:convert';

class GenderModel {
  final List<GenderModelDatum> data;

  GenderModel({
    required this.data,
  });

  factory GenderModel.fromRawJson(String str) => GenderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    data: List<GenderModelDatum>.from(json["data"].map((x) => GenderModelDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class GenderModelDatum {
  final int value;
  final String text;

  GenderModelDatum({
    required this.value,
    required this.text,
  });

  factory GenderModelDatum.fromRawJson(String str) => GenderModelDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenderModelDatum.fromJson(Map<String, dynamic> json) => GenderModelDatum(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}
