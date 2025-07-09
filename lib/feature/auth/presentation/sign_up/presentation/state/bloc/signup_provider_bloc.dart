import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_provider_event.dart';
part 'signup_provider_state.dart';

class SignupProviderBloc extends Bloc<SignupProviderEvent, SignupProviderState> {
  SignupProviderBloc() : super(SignupProviderState()) {
    on<SignupProviderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
