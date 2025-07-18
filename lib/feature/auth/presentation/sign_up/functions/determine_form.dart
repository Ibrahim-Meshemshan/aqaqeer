import 'package:flutter/cupertino.dart';

import '../presentation/ui/widgets/first_step_signUp_form.dart';
import '../presentation/ui/widgets/second_step_signUp_form.dart';
import '../presentation/ui/widgets/third_step_signUp_form.dart';




Widget determineForm(int index) {
  if (index == 0) {
    return FirstStepSignUpForm();
  }
  if (index == 1) {
    return const SecondStepSignUpForm();
  }
  if (index == 2) {
    return const ThirdStepSignupForm();
  }
  else {
    return Container();
  }
}
