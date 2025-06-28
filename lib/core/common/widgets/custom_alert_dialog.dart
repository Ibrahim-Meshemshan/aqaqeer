import 'dart:core';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';
import 'buttons/custom_button.dart';


class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final bool? isTranslatedTitle ;
  final bool? scrollable ;
  final bool? hasCancelButton;
  final bool? hasDivider;
  final bool? hasTitle;
  final bool? xMarkButtonVisibility;
  final Color? titleColor;
  final String? contentKey;
  final Color? contentColor;
  final Widget? content;
  final List<Widget>? actions;
  final String?  acceptButtonNameKey;
  final Color? acceptButtonColor;
  final Color? acceptButtonFontColor;
  final String? cancelButtonNameKey;
  final Color? cancelButtonFontColor;
  final void Function()? onAcceptButtonPressed;
  final void Function()? onCancelButtonPressed;
  final void Function()? onXMarkButtonPressed;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  const CustomAlertDialog({
    super.key,
    this.title,
    this.content,
    this.contentKey,
    this.actions,
    this.acceptButtonNameKey,
    this.cancelButtonNameKey,
    this.titleColor,
    this.contentColor,
    this.acceptButtonColor,
    this.acceptButtonFontColor,
    this.cancelButtonFontColor,
    this.onAcceptButtonPressed,
    this.onCancelButtonPressed,
    this.isTranslatedTitle = true,
    this.scrollable,
    this.onXMarkButtonPressed,
    this.xMarkButtonVisibility,
    this.titlePadding,
    this.actionsPadding,
    this.contentPadding,
    this.hasCancelButton = true,
    this.hasTitle = true,
    this.hasDivider= true,
    this.radius,});
  @override
  Widget build(BuildContext context) {
    return  AlertDialog.adaptive(
      titlePadding:  titlePadding,
      actionsPadding: actionsPadding,
      contentPadding:  contentPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15.0),
      ),
      alignment: Alignment.center,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      scrollable: scrollable ?? false,
      title: hasTitle== true?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(isTranslatedTitle == true ? (title??'').tr(context) : title??'',maxLines: 2,style: CustomTextStyle.titleMedium(context,color: titleColor?? AppColors.primaryColor,fontWeight: FontWeight.bold,),)),
              SizedBox(width: 20,),
              Visibility(
                visible: xMarkButtonVisibility??false,
                child: GestureDetector(
                    onTap: onXMarkButtonPressed ?? (){
                      Navigator.pop(context);
                    },
                    child: Icon(CupertinoIcons.xmark , color:  titleColor?? AppColors.primaryColor,size: 20,)),
              )
            ],
          ),
          SizedBox(height: 10,),
          Visibility(
              visible: hasDivider==true,
              child: Divider())
        ],
      ):
      SizedBox(),
      content: content?? Text(contentKey?.tr(context)??''),
      actions: xMarkButtonVisibility==true? []:
      actions?? [
        hasCancelButton == true? InkWell(
          onTap: onCancelButtonPressed?? (){
            Navigator.pop(context);
          },
          child: Text(
            (cancelButtonNameKey??AppLocalizations.of(context)!.cancel),
            style: CustomTextStyle.bodyMedium(context,color: cancelButtonFontColor ?? AppColors.black),
          ),
        ) : SizedBox(),
        const SizedBox(width: 15,),
        CustomButton(
            padding:  EdgeInsets.zero,
            backgroundColor: acceptButtonColor ??  AppColors.lightPurple,
            borderRadius: BorderRadius.circular(10),
            onPressed: onAcceptButtonPressed ??  (){
              Navigator.pop(context);
            },
            text: (acceptButtonNameKey??'ok').tr(context),
            textStyle: CustomTextStyle.bodySmall(context,color: acceptButtonFontColor ??  AppColors.white)
        ),
      ] ,);
  }
}
