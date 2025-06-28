import 'dart:async';
import 'dart:io';

import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/clear_variable.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_alert_dialog.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../resources/assets.gen.dart';

class LogoutDialogBody extends StatefulWidget {
  const LogoutDialogBody({super.key});

  @override
  State<LogoutDialogBody> createState() => _LogoutDialogBodyState();
}

class _LogoutDialogBodyState extends State<LogoutDialogBody> {
  bool _showLoader = false;

  void _triggerLoader() {
    setState(() {
      _showLoader = true;
    });

    // Hide after 1500 milliseconds
    Timer(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showLoader = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AppManagerBloc, AppManagerState>(
    //   listener: (context, state){
    //   },
    //   builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: _showLoader,
      color: AppColors.primaryColor.withValues(alpha: 0.6),
      progressIndicator: LoaderWidget(),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            CustomAlertDialog(
              contentColor: AppColors.white,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  SvgPicture.asset(Assets.images.logOut1),
                  SizedBox(height: 10),
                  CustomText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    text:
                        AppLocalizations.of(
                          context,
                        )!.are_you_sure_you_want_to_log_out,
                  ),
                ],
              ),
              hasTitle: false,
              hasDivider: false,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Platform.isAndroid ? 0 : 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () async {
                          _triggerLoader();
                          logOutAndClearVariable();
                        },
                        width: 300,
                        height: 50,
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: AppColors.primaryColor,
                        child: CustomText(
                          text: AppLocalizations.of(context)!.logout,
                          style: CustomTextStyle.bodyMedium(
                            context,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: 300,
                        height: 50,
                        borderRadius: BorderRadius.circular(8),
                        borderColor: AppColors.primaryColor,
                        backgroundColor: AppColors.white,
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          style: CustomTextStyle.bodyMedium(
                            context,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
