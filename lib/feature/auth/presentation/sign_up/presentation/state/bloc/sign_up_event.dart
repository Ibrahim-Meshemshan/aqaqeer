part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class SignUpSubmission extends SignUpEvent{
  SignupParams signUpParams;
  SignUpSubmission({required this.signUpParams});
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
