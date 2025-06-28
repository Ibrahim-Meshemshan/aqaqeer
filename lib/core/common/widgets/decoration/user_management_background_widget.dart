// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets.gen.dart';
import '../../config/theme/src/colors.dart';

class UserManagementBackgroundWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final String lang;

  const UserManagementBackgroundWidget({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
    required this.lang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        log("isKeyboardVisible $isKeyboardVisible");
        return Container(
          width: width,
          height: height,
          color: AppColors.white,
          child: Stack(
            fit: StackFit.expand,
            children: [
              isKeyboardVisible
                  ? Positioned(
                    top: 0,
                    right: 0,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 1500),
                      child: SvgPicture.asset(
                        Assets.images.emptyMessages,
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                    ),
                  )
                  : lang == "Arabic"
                  ? Positioned(
                    top: -150,
                    right: width * .55,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 1500),
                      child: SvgPicture.asset(
                        Assets.images.emptyMessages,
                        width: width,
                        height: height,
                        colorFilter: ColorFilter.mode(
                          AppColors.secondaryColor.withOpacity(0.8),
                          BlendMode.color,
                        ),
                      ),
                    ),
                  )
                  : Positioned(
                    top: 0,
                    right: 0,
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 1500),
                      child: SvgPicture.asset(
                        Assets.images.emptyMessages,
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                    ),
                  ),
              child,
            ],
          ),
        );
      },
    );
  }
}
