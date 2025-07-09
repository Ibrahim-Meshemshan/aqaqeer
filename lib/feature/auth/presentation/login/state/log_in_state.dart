// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

@immutable
class LoginState extends Equatable {
  late  BlocStatus<UserModel> logInState;
  late  BlocStatus<ChangePasswordModel> changePasswordState;

   LoginState({this.logInState = const BlocStatus(), this.changePasswordState = const BlocStatus(),
  });



  @override
  List<Object?> get props => [logInState,changePasswordState];

  LoginState copyWith({
    BlocStatus<UserModel>? logInState,
    BlocStatus<ChangePasswordModel>? changePasswordState,
  }) {
    return LoginState(
      logInState: logInState ?? this.logInState,
      changePasswordState: changePasswordState ?? this.changePasswordState,
    );
  }
}
