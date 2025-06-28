class ChangePasswordParam {
  final String oldPassword;
  final String newPassword;

  ChangePasswordParam({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}