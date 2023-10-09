import 'package:flutter/material.dart';

sealed class AppUtils {
  static const kWeekDays=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
  static const kWidth10 = SizedBox(
    width: 10,
  );
  static const kHeight32 = SizedBox(
    height: 32,
  );
  static const kHeight48 = SizedBox(
    height: 48,
  );
  static const kHeight14 = SizedBox(
    height: 14,
  );
  static const kHeight10 = SizedBox(
    height: 10,
  );
  static const kHeight20 = SizedBox(
    height: 20,
  );
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static BorderRadius kBorderRadius12 = BorderRadius.circular(12);
  static const kPaddingAll4=EdgeInsets.all(4);
}
