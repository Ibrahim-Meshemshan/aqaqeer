 class UserModel {
  final String? message;
  final Map<String, List<String>>? errors;
  final String? tokenType;
  final int? expiresIn;
  final String? accessToken;
  late final String? refreshToken;

  UserModel({
    this.message,
    this.errors,
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'],
      errors: json['errors'] != null
          ? Map<String, List<String>>.from(
        json['errors'].map(
              (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      )
          : null,
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errors': errors,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
