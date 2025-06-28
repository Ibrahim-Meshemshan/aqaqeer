// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../constant/src/app_url.dart';

class ImageProfile extends StatelessWidget {
  String? imagePath;
  Color? borderColor;
   ImageProfile({super.key,required this.imagePath,this.borderColor});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        // margin: EdgeInsets.only(left: 100),
        decoration: BoxDecoration(
            border: Border.all(color:borderColor?? AppColors.primaryColor,width: 3),
            borderRadius: BorderRadius.circular(111)
        ),
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 150,
          height: 150,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(4), // Border width
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(111))),
          child: CircleAvatar(
              backgroundImage: NetworkImage(AppUrl.baseUrl.split('api').join(imagePath!),)
          ),
        ),
      ),
    );
  }
}
