import 'dart:convert';

class ContactProfileModel {
  final ContactProfileModelData data;

  ContactProfileModel({
    required this.data,
  });

  factory ContactProfileModel.fromRawJson(String str) =>
      ContactProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactProfileModel.fromJson(Map<String, dynamic> json) =>
      ContactProfileModel(
        data: ContactProfileModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class ContactProfileModelData {
  final Address email;
  final Address mobile;
  final Address address;
  final Address state;

  ContactProfileModelData({
    required this.email,
    required this.mobile,
    required this.address,
    required this.state,
  });

  factory ContactProfileModelData.fromRawJson(String str) =>
      ContactProfileModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactProfileModelData.fromJson(Map<String, dynamic> json) =>
      ContactProfileModelData(
        email: Address.fromJson(json["email"]),
        mobile: Address.fromJson(json["mobile"]),
        address: Address.fromJson(json["address"]),
        state: Address.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
    "email": email.toJson(),
    "mobile": mobile.toJson(),
    "address": address.toJson(),
    "state": state.toJson(),
  };
}

class Address {
  dynamic value;
  final bool isLocked;

  Address({
    required this.value,
    required this.isLocked,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    value: json["value"],
    isLocked: json["is_locked"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "is_locked": isLocked,
  };
}
