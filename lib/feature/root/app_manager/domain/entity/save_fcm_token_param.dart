class SaveFcmTokenParams {
  final String tokenType;
  final String fcmToken;

  // final String controllern;

  SaveFcmTokenParams({
    required this.tokenType,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'tokenType': tokenType,
      'fcmToken': fcmToken,
      // 'rememberToken':token
    };
  }
}
