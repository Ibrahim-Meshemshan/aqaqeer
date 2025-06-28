import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/routes/routes_names.dart';
import '../../state/sign_up_provider.dart';

class SecondStepSignUpForm extends StatefulWidget {
  const SecondStepSignUpForm({super.key});
  @override
  State<SecondStepSignUpForm> createState() => _SecondStepSignUpFormState();
}

class _SecondStepSignUpFormState extends State<SecondStepSignUpForm> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  TextEditingController nationalNumber = TextEditingController(text: locator.get<SignUpProvider>().nationalId);
  TextEditingController mobile = TextEditingController(text: locator.get<SignUpProvider>().mobile);
  final FocusNode nationalNumberFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Attach form key
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'الرقم الوطني', fontWeight: FontWeight.bold),
          SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextField(
              cursorColor: AppColors.secondaryColor,
              border: true,
              maxLength: 11,
              filledColor: AppColors.white,
              enabledBorder: CustomBorders.authBorder,
              focusedBorder: CustomBorders.focusBorder,
              errorBorder: CustomBorders.errorBorder,
              focusedErrorBorder: CustomBorders.errorBorder,
              isNumberFormat: true,
              focusNode: nationalNumberFocusNode,
              onSubmitted: (value) {
                FocusScope.of(context).requestFocus(mobileFocusNode);
              },
       //       textInputAction: TextInputAction.next,

              hintText: 'الرقم الوطني',
              keyboardType: TextInputType.number,
              hintStyle: TextStyle(color: AppColors.primaryGray2),
              prefixIcon: Icon(CupertinoIcons.person_crop_rectangle, color: AppColors.primaryGray2),
              controller: nationalNumber.text.isEmpty ? TextEditingController(text: locator.get<SignUpProvider>().nationalId) : nationalNumber,
              onChanged: (txt) {
                locator.get<SignUpProvider>().nationalId = txt;
              },
              customValidator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجى إدخال الرقم الوطني';
                }
                if (value.length != 11) {
                  return 'يجب أن يحتوي الرقم الوطني على 11 رقمًا';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          CustomText(text: 'رقم الموبايل', fontWeight: FontWeight.bold),
          SizedBox(height: 10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextField(
              cursorColor: AppColors.secondaryColor,
              border: true,
              filledColor: AppColors.white,
              keyboardType: TextInputType.number,
              enabledBorder: CustomBorders.authBorder,
              focusedBorder: CustomBorders.focusBorder,
              errorBorder: CustomBorders.errorBorder,
            //  maxLength: 11,
            //   inputMobileFormatters: true,
              focusNode: mobileFocusNode,
              focusedErrorBorder: CustomBorders.errorBorder,
              // hintText: 'رقم الموبايل',
              isNumberFormat: true,
              hintStyle: TextStyle(color: AppColors.primaryGray2),
              prefixIcon:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CustomText(text: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode}',style: CustomTextStyle.titleMedium(context),),
                ],
              ),
              controller: mobile.text.isEmpty ? TextEditingController(text: locator.get<SignUpProvider>().mobile) : mobile,
              onChanged: (txt) {
                locator.get<SignUpProvider>().mobile = txt;
              },
              // hintText: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
              // format: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
              customValidator: (value) {
                // if (value == null || value.trim().isEmpty) {
                //   return 'يرجى إدخال رقم الموبايل';
                // }
                //
                // // Get the mask dynamically
                // final mask = locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint ?? '';
                //
                // // Count how many digits are expected in the mask (number of # characters)
                // final requiredDigits = '#'.allMatches(mask).length;
                //
                // // Remove all non-digit characters from the input
                // final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
                //
                // if (digitsOnly.length < requiredDigits) {
                //   return 'يرجى إدخال رقم موبايل صحيح';
                // }
                //
                // return null;
              },

            ),
          ),
          SizedBox(height: 20),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  height: 50,
                  width: getWidthScreen(context) / 3,
                  onPressed: () {
                    context.read<SignUpProvider>().setFormIndex(0);
                  },
                  text: 'السابق',
                ),
                SizedBox(width: 20),
                CustomButton(
                  height: 50,
                  width: getWidthScreen(context) / 3,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) { // Validate before proceeding
                      Navigator.pushNamed(context, RoutesNames.viewScreen);
                    }
                  },
                  text: 'التالي',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

