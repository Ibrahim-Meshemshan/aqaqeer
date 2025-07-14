part of 'signup_provider_cubit.dart';

class SignupProviderState {
   int formIndex = 0;
   String? firstName;
   String? meddleName;
   String? lastName;
   String? mobile;
   String? password;
   String? confirmPassword;

   SignupProviderState({
    this.formIndex = 0,
    this.firstName,
    this.meddleName,
    this.lastName,
    this.mobile,
    this.password,
    this.confirmPassword,
  });

   SignupProviderState copyWith({
    int? formIndex,
    String? name,
    String? meddleName,
    String? lastName,
    String? mobile,
    String? password,
    String? confirmPassword,
  }) {
    return SignupProviderState(
      formIndex: formIndex ?? this.formIndex,
      firstName: name ?? this.firstName,
      meddleName: meddleName ?? this.meddleName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}


