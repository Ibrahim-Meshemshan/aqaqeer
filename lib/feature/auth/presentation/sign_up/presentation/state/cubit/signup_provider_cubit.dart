import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_provider_state.dart';

class SignupProviderCubit extends Cubit<SignupProviderState> {
  SignupProviderCubit() : super(SignupProviderState());


  void setFormIndex(int index){
    emit(state.copyWith(formIndex: index));
  }
  void updateFirstName(String name) {
    emit(state.copyWith(name: name));
  }
  void updateMeddleName(String meddleName) {
    emit(state.copyWith(meddleName: meddleName));
  }
  void updateLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }
  void updateMobile(String mobile) {
    emit(state.copyWith(mobile: mobile));
  }
}
