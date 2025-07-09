part of 'log_in_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final LoginParams loginParams;
  Login({required this.loginParams});
}

class ChangePassword extends LoginEvent {
  final ChangePasswordParam changePasswordParam;

  ChangePassword({required this.changePasswordParam});
}
