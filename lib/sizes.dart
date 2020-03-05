import 'package:flutter/widgets.dart';

class ArchMediaSizes {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double devicePixelRatio;

  static double defaultButtonFontSize = 14.0;
  static double defaultTextSize = 13.0;
  static double defaultTitleSize = 16.0;

  static double baselineWith = 1080.0;
  static double baselineHeight = 1920.0;

  static double statusBarHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    devicePixelRatio = _mediaQueryData.devicePixelRatio;

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    statusBarHeight = _mediaQueryData.padding.top;
  }

  static double getRatioSize(double size) {
    return size * screenWidth / baselineWith;
  }

  static double getRatioWidth(double size) {
    return size * screenWidth / baselineWith;
  }

  static double getRatioHeight(double size) {
    return size * screenHeight / baselineHeight;
  }

  static double getFontSize(double fontSize) {
    return fontSize / _mediaQueryData.textScaleFactor;
  }

  static double getDefaultButtonFontSize() => getFontSize(defaultButtonFontSize);

  static double getDefaultTextSize() => getFontSize(defaultTextSize);

  static double getDefaultTitleSize() => getFontSize(defaultTitleSize);

  static EdgeInsets insetsAll(double size) {
    return EdgeInsets.all(getRatioSize(size));
  }

  static EdgeInsets insetsOnly(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(
      top: getRatioSize(top),
      right: getRatioSize(right),
      bottom: getRatioSize(bottom),
      left: getRatioSize(left),
    );
  }
}
