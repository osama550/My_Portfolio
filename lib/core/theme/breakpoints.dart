import 'package:flutter/material.dart';

@immutable
class Breakpoints {
  static const double mobile = 400;
  static const double tablet = 600;
  static const double desktop = 1000;

  static DeviceType of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < tablet) return DeviceType.mobile;
    if (width < desktop) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}

enum DeviceType { mobile, tablet, desktop }

extension ResponsiveContextExtensions on BuildContext {
  DeviceType get deviceType => Breakpoints.of(this);
  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
}
