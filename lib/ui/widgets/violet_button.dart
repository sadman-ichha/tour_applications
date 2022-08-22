// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/const/app_color.dart';

class VioletButton extends StatelessWidget {
  String buttonText;
  final Function onTap;
  VioletButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onTap();
        },
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.violetColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: _value == false
              ? Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Please wait..",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: .40,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
