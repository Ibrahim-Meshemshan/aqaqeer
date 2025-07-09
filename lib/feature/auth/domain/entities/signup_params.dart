class SignupParams {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? mobile;
  final String? password;
  final String? confirmPassword;



  SignupParams({required this.firstName,required this.password,required this.middleName,required this.lastName,required this.mobile,required this.confirmPassword, });

  Map<String,dynamic> toJson(){
    return{
      'first_name':firstName,
      'middle_name':middleName,
      'last_name':lastName,
      'mobile':mobile,
      'password':password,
      'password_confirmation':confirmPassword,
    };
  }
}