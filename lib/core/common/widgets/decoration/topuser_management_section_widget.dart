// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../../../../resources/assets.gen.dart';



class TopUserManagementSectionWidget extends StatelessWidget {
  const TopUserManagementSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.icons.mainLogo.path,
        width: 150,
        height: 150,
      ),
    );
  }
}
