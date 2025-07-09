class LoginParams{
  final String? password;
  final String? userName;


  LoginParams({required this.userName,this.password});

  Map<String,dynamic> toJson(){
    return{
      'username':userName,
      'password':password,
    };
  }
}