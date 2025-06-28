class LoginParams{
  final String? password;
  final String? userName;
  final String? rememberToken;

  LoginParams({required this.userName, this.rememberToken,this.password});

  Map<String,dynamic> toJson(){
    return{
      'username':userName,
      'password':password,
      'rememberToken':rememberToken
    };
  }
}