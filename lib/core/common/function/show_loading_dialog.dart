import 'package:flutter/material.dart';
import '../config/theme/src/colors.dart';

void showLoadingDialog (BuildContext context){
  showDialog(
    // barrierColor: AppColors.transparent,
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );
    },
  );
}