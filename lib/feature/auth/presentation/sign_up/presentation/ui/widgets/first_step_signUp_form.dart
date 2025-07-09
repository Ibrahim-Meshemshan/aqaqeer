import 'package:aqaqeer/core/common/function/validator.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../state/sign_up_provider.dart';

class FirstStepSignUpForm extends StatefulWidget {

  const FirstStepSignUpForm({super.key});

  @override
  State<FirstStepSignUpForm> createState() => _FirstStepSignUpFormState();
}

class _FirstStepSignUpFormState extends State<FirstStepSignUpForm> {
  final _formKey = GlobalKey<FormState>(); // Add form key
  TextEditingController firstName = TextEditingController(
    text: locator.get<SignUpProvider>().name,
  );
  TextEditingController last_name = TextEditingController(
    text: locator.get<SignUpProvider>().last_name,
  );
  TextEditingController meddle_name = TextEditingController(
    text: locator.get<SignUpProvider>().meddle_name,
  );

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: localization.first_name,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomTextField(
              cursorColor: AppColors.lightPurple,
              border: true,
              filledColor: AppColors.lightGray,
              disabledBorder: CustomBorders.authBorder,
              enabledBorder: CustomBorders.authBorder,
              focusedBorder: CustomBorders.focusBorder,
              errorBorder: CustomBorders.errorBorder,
              focusedErrorBorder: CustomBorders.errorBorder,
              hintText: localization.first_name,
              textInputAction: TextInputAction.next,
              hintStyle: TextStyle(color: AppColors.black),
              prefixIcon: Icon(Icons.person_outlined, color: AppColors.black),
              controller: firstName,
              onChanged: (txt) {
                locator.get<SignUpProvider>().name = txt;
              },
              customValidator: (value) => validator(context: context,value: value)
            ), // first name
            SizedBox(height: 20),
            CustomText(
              text: localization.meddle_name,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomTextField(
              cursorColor: AppColors.lightPurple,
              border: true,
              filledColor: AppColors.lightGray,
              disabledBorder: CustomBorders.authBorder,
              enabledBorder: CustomBorders.authBorder,
              focusedBorder: CustomBorders.focusBorder,
              errorBorder: CustomBorders.errorBorder,
              focusedErrorBorder: CustomBorders.errorBorder,
              hintText: localization.meddle_name,
              textInputAction: TextInputAction.next,
              hintStyle: TextStyle(color: AppColors.black),
              prefixIcon: Icon(Icons.person_outlined, color: AppColors.black),
              controller: meddle_name,
              onChanged: (txt) {
                locator.get<SignUpProvider>().meddle_name = txt;
              },
              customValidator: (value) => validator(context: context,value: value)
            ), // father name
            SizedBox(height: 20),
            CustomText(
              text: localization.last_name,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomTextField(
              cursorColor: AppColors.lightPurple,
              border: true,
              filledColor: AppColors.lightGray,
              enabledBorder: CustomBorders.authBorder,
              disabledBorder: CustomBorders.authBorder,
              focusedBorder: CustomBorders.focusBorder,
              errorBorder: CustomBorders.errorBorder,
              focusedErrorBorder: CustomBorders.errorBorder,
              hintText: localization.last_name,
              hintStyle: TextStyle(color: AppColors.black, fontSize: 16),
              prefixIcon: Icon(Icons.people_outline, color: AppColors.black),
              controller: last_name,
              onChanged: (txt) {
                locator.get<SignUpProvider>().last_name = txt;
              },
              customValidator: (value) => validator(context: context,value: value)
            ), // last name
            SizedBox(height: 30),
            Container(
              color: AppColors.white,
              child: CustomButton(
                borderRadius: BorderRadius.circular(35),
                height: 54,
                width: getWidthScreen(context),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (context.read<SignUpProvider>().formIndex == 0) {
                      context.read<SignUpProvider>().setFormIndex(1);
                    } else if (context.read<SignUpProvider>().formIndex == 1) {
                      // context.read<SignUpProvider>().setFormIndex(2);
                      // Navigator.pushNamed(context, RoutesNames.viewScreen);

                      Navigator.pushNamed(context, RoutesNames.viewScreen);
                    }
                  }
                },
                text: localization.next,
                textStyle: CustomTextStyle.titleMedium(
                  context,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
