import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle myTextStyle =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600);
  static InputDecoration textFieldInputDecoration({required String hintText}) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20.sp),
      );
}
