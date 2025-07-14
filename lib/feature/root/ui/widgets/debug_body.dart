import 'dart:developer';
import 'dart:io';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/common/config/theme/src/colors.dart';
import 'dart:typed_data';

import '../../../../core/common/config/theme/src/styles.dart';
import '../../../../core/common/function/get_width_height_screen.dart';
import '../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../core/common/widgets/loader_widget.dart';
import '../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../core/injection/injection.dart';
import '../../app_manager/data/data_source/local/app_manager_local.dart';
import '../../app_manager/domain/entity/send_error_param.dart';
import '../../state/app_manager_state/app_manager_bloc.dart';
import 'captured_image.dart';
class DebugBody extends StatefulWidget {
   Uint8List? capturedImage;
   DebugBody({super.key,this.capturedImage});
  @override
  State<DebugBody> createState() => _DebugBodyState();
}
class _DebugBodyState extends State<DebugBody> {

  bool shakePhone = locator.get<AppManagerLocal>().getShakePhone()?? true;
  bool isPreparing = false;
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext parentContext) {
    return BlocConsumer<AppManagerBloc, AppManagerState>(
      listener: (context, state) {
        if (state.sendErrorState.isSuccess()) {
          showSnackBar(
              message: state.sendErrorState.model?.message??'',
              icon: Icons.check,
              context: context
          );

          Navigator.pop(context);
        }
        else if (state.sendErrorState.isFail()) {
          showSnackBar(
              message:'default_error'.tr(context),
              icon: Icons.warning_amber,
              context: context
          );
          Navigator.pop(context);
        }
      },
     builder: (context, state) {
    return  ModalProgressHUD(
      progressIndicator:  LoaderWidget(),
      color: AppColors.primaryColor.withValues(alpha: 0.6),
      inAsyncCall: isPreparing || state.sendErrorState.isLoading(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: widget.capturedImage==null? getHeightScreen(context)/2 : 2*getHeightScreen(context)/3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CapturedImage(capturedImage: widget.capturedImage,),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomText(text: 'report_an_app_problem'.tr(context),style: CustomTextStyle.titleMedium(context,color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: CustomText(text: 'if_there_is_problem_submit_report'.tr(context)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'do_you_want_add_notes'.tr(context)),
                      SizedBox(height: 10,),
                      CustomTextField(
                        border: true,
                        filledColor: AppColors.white,
                        enabledBorder: CustomBorders.profileBorder,
                        focusedBorder: CustomBorders.profileBorder,
                        errorBorder: CustomBorders.errorBorder,
                        disabledBorder: CustomBorders.profileBorder,
                        focusedErrorBorder: CustomBorders.errorBorder,
                        hintText: 'write_here'.tr(context),
                        hintStyle: TextStyle(color: AppColors.primaryGray2),
                        controller: notes,
                        onTap: (){
                        },
                        customValidator: (text) {},
                        // minLines: 2,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25,left: 20,right: 20,),
                  child: CustomButton(
                    height: 45,
                    width: getWidthScreen(context),
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: AppColors.primaryColor,
                    child: Text(
                      "send_data".tr(context),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    onPressed:() async {
                      File? attachedFile;
                      if (widget.capturedImage != null) {
                        // attachedFile = await uint8ListToPlatformFile(widget.capturedImage!, 'captured_image.png');
                      }
                      log("enter to send data button");
                      setState(() => isPreparing = true);
                      // final errorParam = await createErrorParam(
                      //   message: 'Debug Mode Message',
                      //   stackTrace: '',
                      //   // notes: notes.text,
                      //   // attachedFile: await MultipartFile.fromFile(attachedFile?.path??'', filename: "screenshot.png")
                      // );
                       setState(() => isPreparing = false);
                      // locator.get<AppManagerBloc>().add(SendError(errorParam: errorParam));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "shake_phone_to_report".tr(context)),
                      Switch(
                      value: shakePhone,
                      onChanged: (value) {
                             setState(() {
                               shakePhone = value;
                               locator.get<AppManagerLocal>().setShakePhone(value);
                           });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
