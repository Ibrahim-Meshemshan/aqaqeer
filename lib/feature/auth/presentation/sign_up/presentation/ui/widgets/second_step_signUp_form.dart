import 'package:aqaqeer/core/common/config/theme/src/styles.dart';
import 'package:aqaqeer/core/common/function/validator.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/cubit/signup_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../../../../core/routes/routes_names.dart';
import '../../state/sign_up_provider.dart';

class SecondStepSignUpForm extends StatefulWidget {
  const SecondStepSignUpForm({super.key});
  @override
  State<SecondStepSignUpForm> createState() => _SecondStepSignUpFormState();
}

class _SecondStepSignUpFormState extends State<SecondStepSignUpForm> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController mobile = TextEditingController(text: locator.get<SignupProviderCubit>().state.mobile);

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Form(
      key: _formKey, // Attach form key
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: localization.mobile_number, fontWeight: FontWeight.bold),
          SizedBox(height: 10),
          CustomTextField(
            cursorColor: AppColors.secondaryColor,
            border: true,
            filledColor: AppColors.white,
            keyboardType: TextInputType.number,
            enabledBorder: CustomBorders.authBorder,
            focusedBorder: CustomBorders.focusBorder,
            errorBorder: CustomBorders.errorBorder,
            maxLength: 10,
            isMobileNum: true,
            focusNode: mobileFocusNode,
            focusedErrorBorder: CustomBorders.errorBorder,
            isNumberFormat: true,
            hintStyle: CustomTextStyle.titleSmall(context),
            prefixIcon: Icon(Icons.phone),
            //mobile.text.isEmpty ? TextEditingController(
            //                 text: locator
            //                     .get<SignUpProvider>()
            //                     .mobile) : mobile
            controller: mobile,
            onChanged: (txt) =>
                context.read<SignupProviderCubit>().updateMobile(txt),
            hintText: localization.mobile_number,
            // format: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
            customValidator: (value) =>
                validator(context: context,
                  value: value, isMobileNum: true,),
          ),
          SizedBox(height: 10),

          SizedBox(height: 20),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  height: 55,
                  width: getWidthScreen(context) / 3,
                  onPressed: () {
                    context.read<SignupProviderCubit>().setFormIndex(0);
                  },
                  text: localization.previous,
                ),
                SizedBox(width: 20),
                CustomButton(
                  height: 55,
                  width: getWidthScreen(context) / 3,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, RoutesNames.viewScreen);
                    }
                  },
                  text: localization.next,
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

