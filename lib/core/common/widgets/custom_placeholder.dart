import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/assets.gen.dart';
import '../config/theme/src/colors.dart';


class CustomPlaceholder extends StatelessWidget {
  final String? image; // Path for the image to display
  final String? message; // Text message to display
  final double? imageSize; // Size of the image
  final TextStyle? messageStyle; // Custom text style for the message
  final bool? svg;
  final bool topPadding;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomPlaceholder({
    super.key,
    this.image, // Default image
    this.message, // Default message
    this.imageSize, // Default image size
    this.messageStyle,
    this.svg= false,
    this.topPadding = false,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: topPadding,
              child: const SizedBox(height: 20,)),
          svg==true? SvgPicture.asset(
              image ?? Assets.images.emptyMessages,
              height: imageSize?? 140,

          ):
          Image.asset(
            image ?? Assets.images.emptyMessages,
            // Replace with your "no permission" image asset
            width: imageSize ?? 180,
            height: imageSize ?? 180,
          ),
          Visibility(
              visible: svg==false,
              child: const SizedBox(height: 16)),
          Text(
            message ?? ('unknown_error').tr(context),
            style: messageStyle ??
                TextStyle(
                  fontSize: fontSize??  14,
                  fontWeight:fontWeight?? FontWeight.bold,
                  color: color?? AppColors.gray,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
