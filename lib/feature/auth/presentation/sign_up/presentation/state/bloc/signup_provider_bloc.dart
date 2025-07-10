import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'signup_provider_event.dart';
part 'signup_provider_state.dart';

class SignupProviderBloc extends Bloc<SignupProviderEvent, SignupProviderState> {
  SignupProviderBloc() : super(SignupProviderState()) {
    on<SignupProviderEvent>((event, emit) {
      if(event is UpdateFormField)
      emit(
        state.copyWith(
          formIndex: event.formIndex ??  state.formIndex,
          first_name: state.first_name,
          meddle_name: state.meddle_name,
          last_name: state.last_name,
          mobile: state.mobile,
          password: state.password,
          confirmPassword: state.confirmPassword,
          otp: state.otp,
        )
      );
    });
  }
}
