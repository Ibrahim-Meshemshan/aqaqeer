part of 'signup_provider_bloc.dart';

class SignupProviderEvent {}


class UpdateFormField extends SignupProviderEvent {
  final int? formIndex;
  final String? first_name;
  final String? lastName;
  final String? middleName;
  final String? city;
  final String? nationalId;
  final String? mobile;
  final String? email;
  final String? date;
  final String? password;
  final String? confirmPassword;
  final String? otp;

  UpdateFormField({
    this.formIndex,
    this.first_name,
    this.lastName,
    this.middleName,
    this.city,
    this.nationalId,
    this.mobile,
    this.email,
    this.date,
    this.password,
    this.confirmPassword,
    this.otp,
  });
}