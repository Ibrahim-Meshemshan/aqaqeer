import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
 import '../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../domain/entities/change_password_params.dart';
import '../state/log_in_bloc.dart';

class ChangePasswordDialog extends StatefulWidget {
  final LoginBloc bloc;

  const ChangePasswordDialog({super.key, required this.bloc});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(
        'Change Password',
        style: CustomTextStyle.titleMedium(context,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      titlePadding: const EdgeInsets.all(16),
      content: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: oldPasswordController,
                // autofocus: true,
                textAlign: TextAlign.center,
                // filled: true,
                hintText: 'Old Password',
                // fillColor: AppColors.primaryGray,
                // border: OutlineInputBorder(
                //   borderSide: BorderSide.none,
                //   borderRadius: BorderRadius.circular(15.0),
                // ),
                isPassword: true,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: newPasswordController,
                // autofocus: true,
                textAlign: TextAlign.center,
                hintText: 'New Password',
                // isPassword: true,
                isPassword: true,
              ),
              const SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      ChangePasswordParam params =
                      ChangePasswordParam(
                        oldPassword: oldPasswordController.text,
                        newPassword: newPasswordController.text,
                      );
                      log(params.newPassword);
                      log(params.oldPassword);
                      Navigator.pop(context);
                      widget.bloc.add(
                        ChangePassword(
                          changePasswordParam: params,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 1,
                      // padding: buttonRPadding.r,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(24)),
                    ),
                    child: Text(
                      ('ok').tr(context),
                      style: CustomTextStyle.titleMedium(
                          context,
                          color: AppColors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
