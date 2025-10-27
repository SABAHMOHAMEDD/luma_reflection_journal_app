import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUtils {
  SystemUtils._();

  static void setAppStatusBarThemeForAndroid({
    splash = false,
    Color? navbarColor,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: splash
            ? Colors.transparent
            : navbarColor ?? Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  //hide status bar and navigation bar
  static void hideStatusBarAndNavigationBarForAndroid() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
  }

  static void setPreferredOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
