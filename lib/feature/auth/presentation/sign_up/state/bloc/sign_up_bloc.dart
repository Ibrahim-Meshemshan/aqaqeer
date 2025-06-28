
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../../../../../core/bloc_status.dart';
import '../../../../data/repo/auth_repository_impl.dart';


part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthRepositoryImpl authRepositoryImpl;

  SignUpBloc(this.authRepositoryImpl) : super(SignUpState()) {
    on<SignUpEvent>((event, emit) async {
      // if (event is SignUpSubmission) {
      //   //print("formKey.currentState?.validate() ${signUpFormKey.currentState?.validate() ?? false}");
      //   emit(state.copyWith(signUpState: BlocStatus.loading()));
      //   final result =
      //       await authRepositoryImpl.signUp(signUpParams: event.signUpParams);
      //   result.fold((fail) {
      //     log('Caught error: ${fail.message}');
      //     emit(state.copyWith(
      //         signUpState: BlocStatus.fail(error: fail.message)));
      //   }, (model) {
      //     emit(state.copyWith(signUpState: BlocStatus.success(model: model)));
      //   });
      //   if ((signUpFormKey.currentState?.validate() ?? false)) {}
      // }
      // if (event is GetSignUpOtpEvent) {
      //   emit(state.copyWith(signupOtpState: BlocStatus.loading()));
      //   final result = await authRepositoryImpl.getOtp(mobile: event.mobile);
      //   result.fold((fail) {
      //     log('Caught error: ${fail.message}');
      //     emit(state.copyWith(
      //         signupOtpState: BlocStatus.fail(error: fail.message)));
      //   }, (model) {
      //     emit(
      //         state.copyWith(signupOtpState: BlocStatus.success(model: model)));
      //   });
      // }

      // if (event is ForgetPasswordEvent) {
      //   emit(state.copyWith(forgetPasswordState: BlocStatus.loading()));
      //   final result = await authRepositoryImpl.forgetPassword(mobile: event.mobile);
      //   result.fold((fail) {
      //     log('Caught error: ${fail.message}');
      //     emit(state.copyWith(
      //         forgetPasswordState: BlocStatus.fail(error: fail.message)));
      //   }, (model) {
      //     emit(state.copyWith(
      //         forgetPasswordState: BlocStatus.success(model: model)));
      //   });
      //  // if ((loginFormKey.currentState?.validate() ?? false)) {}
      // }


      // if (event is BirthdateRequirement) {
      //   emit(state.copyWith(birthdateState: BlocStatus.loading()));
      //   final result = await authRepositoryImpl.birthdateRequirement();
      //   result.fold((fail) {
      //     log('Caught error: ${fail.message}');
      //     emit(state.copyWith(
      //         birthdateState: BlocStatus.fail(error: fail.message)));
      //   }, (model) {
      //     emit(
      //         state.copyWith(birthdateState: BlocStatus.success(model: model)));
      //   });
      // }


    });
  }

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
}
