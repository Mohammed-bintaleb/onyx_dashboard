import 'package:flutter/material.dart';
import 'size_config.dart';

abstract class AppStyles {
  static TextStyle styleBold32(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color:
          Theme.of(context).textTheme.bodySmall?.color ??
          const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey[600],
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle style14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey[600],
      fontSize: getResponsiveFontSize(context, fontSize: 10),
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.mobile) {
    return width / 200;
  } else {
    return width / 500;
  }
}
