import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/validator.dart';
import '../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../domain/entities/login_params.dart';
import '../state/log_in_bloc.dart';

class UsernamePasswordLoginSection extends StatefulWidget {
  final LoginBloc bloc;
  final Object? nameCustomer;

  const UsernamePasswordLoginSection({super.key, required this.bloc,required this.nameCustomer});

  @override
  State<UsernamePasswordLoginSection> createState() =>
      _UsernamePasswordLoginSectionState();
}

class _UsernamePasswordLoginSectionState
    extends State<UsernamePasswordLoginSection> {
  // String? lang = locator.get<LanguageStorage>().getCurrentLang();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Center(
              child: Text(
            widget.nameCustomer.toString(),
            style: CustomTextStyle.headlineSmall(context)
                ?.copyWith(fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 40.0,
          ),
          CustomTextField(
            controller: userNameController,
            hintText: ('user_name').tr(context),
            enabled: true,
            maxLines: 1,
            customValidator: (value) => validator(context: context,isMobileNum: true),
            // colorFill: AppColors.primaryGray,
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextField(
            maxLines: 1,
            controller: passwordController,
            enabled: true,
            isPassword: true,
            hintText: ('password').tr(context),
            customValidator: (value) => validator(context: context,isPassword: true),
            // colorFill: AppColors.primaryGray,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: CustomButton(
              text: ('login').tr(context),
              onPressed: () {
                // LoginParams params = LoginParams(
                //   userName: userNameController.text,
                //   password: passwordController.text,
                // );
                // log('the params are ${params.password} and ${params.userName}');
                //
                // widget.bloc.add(
                //   Login(loginParams: params),
                // );
                if (_formKey.currentState!.validate()!=null) {
                  LoginParams params = LoginParams(
                    userName: userNameController.text,
                    password: passwordController.text,
                  );
                  log('the params are ${params.password} and ${params.userName}');
                  widget.bloc.add(
                    Login(loginParams: params),
                  );
                }
              },
              backgroundColor: AppColors.primaryColor,
              textStyle: CustomTextStyle.titleMedium(
                context,
                color: AppColors.white,
              ),
              padding: buttonRPadding,
              borderRadius: BorderRadius.circular(24),
              elevation: 1,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
