part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
   BlocStatus<SignupModel> signUpState;
   // BlocStatus<dynamic> otpVerifyState;
   // BlocStatus<BirthdateModel> birthdateState;
   // final BlocStatus<dynamic> otpResendState;
   // BlocStatus<OtpModel> signupOtpState;
   // BlocStatus<ForgetPasswordModel> forgetPasswordState;
   SignUpState(
      {this.signUpState = const BlocStatus(),
      // this.signupOtpState = const BlocStatus(),
      //   this.otpVerifyState = const BlocStatus(),
      //   this.otpResendState = const BlocStatus(),
      //   this.forgetPasswordState = const BlocStatus(),
      //   this.birthdateState = const BlocStatus(),

      });

   SignUpState copyWith({
     BlocStatus<SignupModel>? signUpState,
   }) {
     return SignUpState(
       signUpState: signUpState ?? this.signUpState,
     );
   }
}

