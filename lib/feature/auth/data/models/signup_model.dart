// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    final String? message;
    final List<String>? mobile;
    final String? tokenType;
    final int? expiresIn;
    final String? accessToken;
    final String? refreshToken;

    SignupModel({
        this.message,
        this.mobile,
        this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        message: json["message"],
        mobile: json["mobile"] == null ? [] : List<String>.from(json["mobile"]!.map((x) => x)),
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "mobile": mobile == null ? [] : List<dynamic>.from(mobile!.map((x) => x)),
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
    String? getAllErrorMessages(){
        if(mobile==null) return message ?? 'Unknown Error Occurred';
        final errorMessage = mobile?.map((entry) {
            final value = entry;
            return '${value.toString()}';
        },).join('\n');
        return errorMessage;
    }
}
