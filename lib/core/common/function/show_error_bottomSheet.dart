import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../feature/app.dart';
import '../../../feature/root/ui/widgets/debug_body.dart';
import '../config/theme/src/colors.dart';

void showErrorBottomSheet(BuildContext context , {Uint8List?  screenshotImage}) async {
  showModalBottomSheet(
    constraints: const BoxConstraints(maxWidth: double.infinity),
    backgroundColor: AppColors.white,
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (_) => DebugBody(capturedImage: screenshotImage,),
  ).then((_){
    isBottomSheetShown = false;
  });
}