import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../feature/auth/data/data_source/local/local.dart';
import '../../../injection/injection.dart';
import '../../constant/strings.dart';

Widget secureNetworkImage({
  required String url,
    Widget? loadingPlaceholder,
   Widget? errorPlaceholder,
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
}) {
  final headers = {
    'token': locator.get<AuthLocal>().getAuthToken() ?? '',
    'os-type': AppStrings.operatingSystem,
    // 'userTypeCode': 'RAS_USER',
  };

  if (url.toLowerCase().endsWith('.svg')) {
    return SvgPicture.network(
      url,
      headers: headers,
      width: width,
      height: height,
      fit: fit,
      placeholderBuilder: (_) => loadingPlaceholder??SizedBox.shrink(),
      errorBuilder: (context, error, stackTrace) => errorPlaceholder??SizedBox.shrink(),

    );
  } else {
    return Image.network(
      url,
      headers: headers,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return loadingPlaceholder??SizedBox.shrink();
      },
      errorBuilder: (context, error, stackTrace) => errorPlaceholder??SizedBox.shrink(),
    );
  }
}
