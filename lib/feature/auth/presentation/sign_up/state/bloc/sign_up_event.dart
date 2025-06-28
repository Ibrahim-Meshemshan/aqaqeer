part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class SignUpSubmission extends SignUpEvent{
  // SignUpParams? signUpParams;
  // SignUpSubmission({this.signUpParams});
}

class GetSignUpOtpEvent extends SignUpEvent {
  final String mobile;

  GetSignUpOtpEvent({required this.mobile});
}

class ForgetPasswordEvent extends SignUpEvent {
  final String mobile;

  ForgetPasswordEvent({required this.mobile});
}

class BirthdateRequirement extends SignUpEvent {
  BirthdateRequirement();
}
