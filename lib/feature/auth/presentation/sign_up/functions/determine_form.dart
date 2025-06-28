import 'package:flutter/cupertino.dart';

import '../ui/widgets/first_step_signUp_form.dart';
import '../ui/widgets/second_step_signUp_form.dart';
import '../ui/widgets/third_step_signUp_form.dart';



Widget determineForm(int index,bool birthdateRequired) {
  if (index == 0) {
    return FirstStepSignUpForm(birthdateRequired:birthdateRequired);
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
