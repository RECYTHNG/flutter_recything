import 'package:flutter/services.dart';

class SystemUiOverlayUtils {
  void setSystemUiOverlay(Color color, bool isIconDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness:
            isIconDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
