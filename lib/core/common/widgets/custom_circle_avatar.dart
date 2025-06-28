import 'package:flutter/material.dart';
import '../config/theme/src/colors.dart';
class CustomCircleAvatar extends StatelessWidget {
  final Color? externalBackgroundColor;
  final Color? internalBackgroundColor;
  final double? radius;
  final String? imageUrl;
  const CustomCircleAvatar({super.key, this.externalBackgroundColor, this.internalBackgroundColor, this.radius,  this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: externalBackgroundColor?? AppColors.primaryColor ,
      radius: radius??35,
      child: CircleAvatar(
        backgroundColor: internalBackgroundColor ?? AppColors.white,
        radius: (radius??35)-1,
       // foregroundImage: imageUrl == null? AssetImage(Assets.assetsImagesNophoto) : null,
        backgroundImage: (imageUrl == null || imageUrl =='')?
        const NetworkImage("https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg") :
        NetworkImage(imageUrl??'') ,
      ),
    );
  }
}
