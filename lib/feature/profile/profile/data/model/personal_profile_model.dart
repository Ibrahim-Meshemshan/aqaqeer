import 'dart:convert';

class PersonalProfileModel {
  final PersonalProfileModelData data;

  PersonalProfileModel({
    required this.data,
  });

  factory PersonalProfileModel.fromRawJson(String str) =>
      PersonalProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalProfileModel.fromJson(Map<String, dynamic> json) =>
      PersonalProfileModel(
        data: PersonalProfileModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "data": data.toJson(),
      };
}

class PersonalProfileModelData {
  final AvatarPath firstName;
  final AvatarPath lastName;
  final AvatarPath nationalId;
  final AvatarPath fatherName;
  final AvatarPath birthDate;
  final AvatarPath gender;
  final AvatarPath maritalStatus;
  final AvatarPath avatarPath;

  PersonalProfileModelData({
    required this.firstName,
    required this.lastName,
    required this.nationalId,
    required this.fatherName,
    required this.birthDate,
    required this.gender,
    required this.maritalStatus,
    required this.avatarPath,
  });

  factory PersonalProfileModelData.fromRawJson(String str) =>
      PersonalProfileModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalProfileModelData.fromJson(Map<String, dynamic> json) =>
      PersonalProfileModelData(
        firstName: AvatarPath.fromJson(json["first_name"]),
        lastName: AvatarPath.fromJson(json["last_name"]),
        nationalId: AvatarPath.fromJson(json["national_id"]),
        fatherName: AvatarPath.fromJson(json["father_name"]),
        birthDate: AvatarPath.fromJson(json["birth_date"]),
        gender: AvatarPath.fromJson(json["gender"]),
        maritalStatus: AvatarPath.fromJson(json["marital_status"]),
        avatarPath: AvatarPath.fromJson(json["avatar_path"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "first_name": firstName.toJson(),
        "last_name": lastName.toJson(),
        "national_id": nationalId.toJson(),
        "father_name": fatherName.toJson(),
        "birth_date": birthDate.toJson(),
        "gender": gender.toJson(),
        "marital_status": maritalStatus.toJson(),
        "avatar_path": avatarPath.toJson(),
      };
}

class AvatarPath {
  dynamic value;
  final bool isLocked;

  AvatarPath({
    required this.value,
    required this.isLocked,
  });

  factory AvatarPath.fromRawJson(String str) =>
      AvatarPath.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvatarPath.fromJson(Map<String, dynamic> json) =>
      AvatarPath(
        value: json["value"],
        isLocked: json["is_locked"],
      );

  Map<String, dynamic> toJson() =>
      {
        "value": value,
        "is_locked": isLocked,
      };
}
