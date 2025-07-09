import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.refreshToken,
    });

    String? tokenType;
    int? expiresIn;
    String? accessToken;
    String? refreshToken;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}
