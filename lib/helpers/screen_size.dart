import 'package:flutter/material.dart';

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);

  static int mobileSize = 850;
  static int tabletSize = 1100;

  bool get isMobile => MediaQuery.of(context).size.width < mobileSize;

  bool get isTablet =>
      MediaQuery.of(context).size.width < tabletSize &&
      MediaQuery.of(context).size.width > mobileSize;

  bool get isDesktop => MediaQuery.of(context).size.width >= tabletSize;

  Size get size => MediaQuery.of(context).size;

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;
}
