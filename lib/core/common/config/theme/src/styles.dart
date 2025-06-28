import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'colors.dart';

///constant
const double horizontalAppPadding = 20;
const double verticalAppPadding = 22;

const kIconSize = 20.0;
const buttonBorderRadius = 24.0;
const String fontFamily = "Almarai";
const designSize = Size(360, 690);

///Style
EdgeInsets buttonRPadding =
const EdgeInsets.symmetric(horizontal: 13, vertical: 15);

EdgeInsets screenPadding = const EdgeInsets.symmetric(
    horizontal: horizontalAppPadding, vertical: verticalAppPadding);

BorderRadius borderRadiusCircular = BorderRadius.circular(buttonBorderRadius);

// final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
//   backgroundColor: AppColors.primaryColor,
//   elevation: 1,
//   padding: buttonRPadding,
//   shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular.r),
// );

final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: AppColors.gray, padding: buttonRPadding,
    textStyle: const TextStyle(color: AppColors.gray),
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusCircular,
    ));
final InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  fillColor: AppColors.primaryGray,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: const TextStyle(color: Colors.red, height: 1),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(
      borderRadius: borderRadiusCircular,
    borderSide: BorderSide.none
  ),
);
final InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
  fillColor: Colors.grey[700],
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    borderRadius: borderRadiusCircular,
  ),
  errorStyle: const TextStyle(color: Colors.red, height: 1),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular,),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: AppColors.primaryColor, padding: buttonRPadding,
  textStyle: const TextStyle(
    fontFamily: fontFamily,
    color: AppColors.primaryColor,
  ),
  side: const BorderSide(color: AppColors.primaryColor),
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
);

final dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: borderRadiusCircular,
  ),
);

final cardTheme = CardTheme(
    margin: EdgeInsets.zero,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22.0),
    ));

const iconTheme = IconThemeData(size: kIconSize, color: AppColors.lightGray);

InputDecoration dynamicInputDecorationTheme({
  required ThemeData themeData,
  required String labelText,
  required IconData icon,
  String? hintText,
}) =>
    InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        errorStyle:
        themeData.textTheme.bodySmall!.copyWith(color: themeData.colorScheme.error),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        prefixIconConstraints: const BoxConstraints(minWidth: 40));

class MyInputBorder extends OutlineInputBorder {
  final Color fillColor;
  const MyInputBorder({
    required this.fillColor,
    super.borderSide,
    super.borderRadius,
    super.gapPadding,
  });

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
        double gapExtent = 0.0,
        double gapPercentage = 0.0,
        TextDirection? textDirection}) {
    super.paint(canvas, rect);
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0);
    assert(_cornersAreCircular(borderRadius));

    final Paint paint = borderSide.toPaint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    if (gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0) {
      Path path = Path();
      path.addRRect(center);
      canvas.drawShadow(
          path.shift(const Offset(0.5, 0.5)), Colors.black26, 2, true);
      canvas.drawShadow(
          path.shift(const Offset(-0.5, -0.5)), Colors.black26, 2, true);
      canvas.drawRRect(center, paint);
    } else {
      final double extent =
      lerpDouble(0.0, gapExtent + gapPadding * 2.0, gapPercentage)!;
      switch (textDirection!) {
        case TextDirection.rtl:
          final Path path = _gapBorderPath(canvas, center,
              math.max(0.0, gapStart + gapPadding - extent), extent);
          canvas.drawPath(path, paint);
          break;

        case TextDirection.ltr:
          final Path path = _gapBorderPath(
              canvas, center, math.max(0.0, gapStart - gapPadding), extent);
          canvas.drawPath(path, paint);
          break;
      }
    }
  }

  static bool _cornersAreCircular(BorderRadius borderRadius) {
    return borderRadius.topLeft.x == borderRadius.topLeft.y &&
        borderRadius.bottomLeft.x == borderRadius.bottomLeft.y &&
        borderRadius.topRight.x == borderRadius.topRight.y &&
        borderRadius.bottomRight.x == borderRadius.bottomRight.y;
  }

  Path _gapBorderPath(
      Canvas canvas, RRect center, double start, double extent) {
    // When the corner radii on any side add up to be greater than the
    // given height, each radius has to be scaled to not exceed the
    // size of the width/height of the RRect.
    final RRect scaledRRect = center.scaleRadii();

    final Rect tlCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.top,
      scaledRRect.tlRadiusX * 2.0,
      scaledRRect.tlRadiusY * 2.0,
    );
    final Rect trCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.trRadiusX * 2.0,
      scaledRRect.top,
      scaledRRect.trRadiusX * 2.0,
      scaledRRect.trRadiusY * 2.0,
    );
    final Rect brCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.brRadiusX * 2.0,
      scaledRRect.bottom - scaledRRect.brRadiusY * 2.0,
      scaledRRect.brRadiusX * 2.0,
      scaledRRect.brRadiusY * 2.0,
    );
    final Rect blCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.bottom - scaledRRect.blRadiusY * 2.0,
      scaledRRect.blRadiusX * 2.0,
      scaledRRect.blRadiusX * 2.0,
    );

    // This assumes that the radius is circular (x and y radius are equal).
    // Currently, BorderRadius only supports circular radii.
    const double cornerArcSweep = math.pi / 2.0;
    final double tlCornerArcSweep = math.acos(
      (1 - start / scaledRRect.tlRadiusX).clamp(0.0, 1.0),
    );

    final Path path = Path()..addArc(tlCorner, math.pi, tlCornerArcSweep);

    if (start > scaledRRect.tlRadiusX) {
      path.lineTo(scaledRRect.left + start, scaledRRect.top);
    }

    const double trCornerArcStart = (3 * math.pi) / 2.0;
    const double trCornerArcSweep = cornerArcSweep;
    if (start + extent < scaledRRect.width - scaledRRect.trRadiusX) {
      path.moveTo(scaledRRect.left + start + extent, scaledRRect.top);
      path.lineTo(scaledRRect.right - scaledRRect.trRadiusX, scaledRRect.top);
      path.addArc(trCorner, trCornerArcStart, trCornerArcSweep);
    } else if (start + extent < scaledRRect.width) {
      final double dx = scaledRRect.width - (start + extent);
      final double sweep = math.asin(
        (1 - dx / scaledRRect.trRadiusX).clamp(0.0, 1.0),
      );
      path.addArc(trCorner, trCornerArcStart + sweep, trCornerArcSweep - sweep);
    }

    return path
      ..moveTo(scaledRRect.right, scaledRRect.top + scaledRRect.trRadiusY)
      ..lineTo(scaledRRect.right, scaledRRect.bottom - scaledRRect.brRadiusY)
      ..addArc(brCorner, 0.0, cornerArcSweep)
      ..lineTo(scaledRRect.left + scaledRRect.blRadiusX, scaledRRect.bottom)
      ..addArc(blCorner, math.pi / 2.0, cornerArcSweep)
      ..lineTo(scaledRRect.left, scaledRRect.top + scaledRRect.tlRadiusY);
  }
}
class CustomTextStyle  {

//the style of the headline
  static TextStyle? headlineLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? headlineMedium(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? headlineSmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }

  //the style of the title
  static TextStyle? titleLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? titleMedium(BuildContext context,{Color? color,FontWeight? fontWeight,TextDecoration? decoration,double? fontSize}) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal,decoration: decoration,fontSize: fontSize);
  }
  static TextStyle? titleSmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }

  // the style of the body
  static TextStyle? bodyLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? bodyMedium(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? bodySmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? myStyle(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return const TextStyle(
      fontSize: 5,

    );
  }
}



