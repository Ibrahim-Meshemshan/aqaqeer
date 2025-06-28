import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/dropdown/dropdown_date_picker.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../state/sign_up_provider.dart';

class FirstStepSignUpForm extends StatefulWidget {
  final bool birthdateRequired;

  const FirstStepSignUpForm({super.key, required this.birthdateRequired});

  @override
  State<FirstStepSignUpForm> createState() => _FirstStepSignUpFormState();
}

class _FirstStepSignUpFormState extends State<FirstStepSignUpForm> {
  final _formKey = GlobalKey<FormState>(); // Add form key
  TextEditingController name = TextEditingController(
    text: locator.get<SignUpProvider>().name,
  );
  TextEditingController surname = TextEditingController(
    text: locator.get<SignUpProvider>().surName,
  );
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode surnameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: localization.first_name,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          CustomTextField(
            // focusNode: nameFocusNode,
            cursorColor: AppColors.lightPurple,
            border: true,
            filledColor: AppColors.lightGray,
            disabledBorder: CustomBorders.authBorder,
            enabledBorder: CustomBorders.authBorder,
            focusedBorder: CustomBorders.focusBorder,
            errorBorder: CustomBorders.errorBorder,
            focusedErrorBorder: CustomBorders.errorBorder,
            hintText: AppLocalizations.of(context)!.first_name,
            textInputAction: TextInputAction.next,
            autofocus: true,
            onSubmitted: (value) {
              // FocusScope.of(
              //   context,
              // ).requestFocus(surnameFocusNode); // Move focus to password field
            },
            hintStyle: TextStyle(color: AppColors.black),
            prefixIcon: Icon(Icons.person_outlined, color: AppColors.black),
            controller: name,
            onChanged: (txt) {
              locator.get<SignUpProvider>().setName(txt);
            },
            customValidator: (value) {
              if (value == null || value.trim().isEmpty) {
                return localization.please_enter_first_name;
              }
              return null;
            },
          ), // first name
          SizedBox(height: 20),
          CustomText(
            text: AppLocalizations.of(context)!.last_name,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          CustomTextField(
            // enabled: false,
            // focusNode: surnameFocusNode,
            // onSubmitted: (value) {
            //   surnameFocusNode.unfocus();
            // },
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
            controller: surname,
            onChanged: (txt) {
              locator.get<SignUpProvider>().surName = txt;
            },
            onTapOutside: (p) {
              // FocusScope.of(context).unfocus();
            },
            customValidator: (value) {
              if (value == null || value.trim().isEmpty) {
                return localization.please_enter_last_name;
              }
              return null;
            },
          ), // last name
          SizedBox(height: 20),
          CustomText(
            text: AppLocalizations.of(context)!.date_of_birth,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          DropdownDatePicker(

            onDateSelected: (day, month, year) {
              String formattedDate =
                  "$year-${month.padLeft(2, '0')}-${day.padLeft(2, '0')}";
              context.read<SignUpProvider>().date = formattedDate;
            },
          ),
          SizedBox(height: 30),
          Container(
            color: AppColors.white,
            // padding: const EdgeInsets.only(left: 10, right: 10),
            child: CustomButton(
              borderRadius: BorderRadius.circular(35),
              height: 54,
              width: getWidthScreen(context),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.birthdateRequired &&
                      (context.read<SignUpProvider>().date == null ||
                          context.read<SignUpProvider>().date!.isEmpty)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localization.please_enter_data)),
                    );
                    return;
                  }
                  // if (context.read<SignUpProvider>().formIndex == 0) {
                  //   context.read<SignUpProvider>().setFormIndex(1);
                  // } else if (context.read<SignUpProvider>().formIndex == 1) {
                  Navigator.pushNamed(context, RoutesNames.viewScreen);
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
    );
  }
}
