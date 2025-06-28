// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../config/theme/src/colors.dart';

class SecondCircularProgress extends StatelessWidget {
  final double? size;
  final Color? evenColor;
  final Color? oddColor;
  const SecondCircularProgress({super.key, this.size, this.evenColor, this.oddColor});

  @override

  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
          size:size?? 30,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven
                    ?evenColor?? AppColors.black.withValues(alpha: 0.7)
                    :oddColor?? AppColors.black.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
            );
          },
        ));
  }
}
