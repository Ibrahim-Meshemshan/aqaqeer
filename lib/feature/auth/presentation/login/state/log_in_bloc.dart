// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/bloc_status.dart';
import '../../../data/models/change_password_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repo/auth_repository_impl.dart';
import '../../../domain/entities/change_password_params.dart';
import '../../../domain/entities/login_params.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositoryImpl authRepositoryImpl;

  LoginBloc({required this.authRepositoryImpl}) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit(state.copyWith(logInState: BlocStatus.loading()));
        (await authRepositoryImpl.login(loginParams: event.loginParams)).fold(
            (fail) {
          emit(
              state.copyWith(logInState: BlocStatus.fail(error: fail.message)));
          log(fail.message);
        },
            (login) => emit(
                state.copyWith(logInState: BlocStatus.success(model: login))));
      }

      if (event is ChangePassword) {
        emit(state.copyWith(changePasswordState: BlocStatus.loading()));
        (await authRepositoryImpl.changePassword(
                changePasswordParam: event.changePasswordParam))
            .fold((fail) {
          emit(state.copyWith(
              changePasswordState: BlocStatus.fail(error: fail.message)));
          log('ChangePassword message ${fail.message}');
        },
                (password) => emit(state.copyWith(
                    changePasswordState: BlocStatus.success(model: password))));
      }
    });
  }
}
