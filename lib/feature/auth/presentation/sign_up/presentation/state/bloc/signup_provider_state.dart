part of 'signup_provider_bloc.dart';

class SignupProviderState extends Equatable {
  int formIndex;
  String? first_name;
  String? last_name;
  String? meddle_name;
  String? mobile;
  String? password;
  String? confirmPassword;
  String? otp;


  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        formIndex,
        first_name,
        last_name,
        mobile,
        meddle_name,
        password,
        confirmPassword,
        otp
      ];

  SignupProviderState({
    this.formIndex = 0,
    this.first_name,
    this.last_name,
    this.meddle_name,
    this.mobile,
    this.password,
    this.confirmPassword,
    this.otp,
  });

  SignupProviderState copyWith({
    int? formIndex,
    String? first_name,
    String? last_name,
    String? meddle_name,
    String? mobile,
    String? password,
    String? confirmPassword,
    String? otp,
  }) {
    return SignupProviderState(
      formIndex: formIndex ?? this.formIndex,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      meddle_name: meddle_name ?? this.meddle_name,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      otp: otp ?? this.otp,
    );
  }
}


