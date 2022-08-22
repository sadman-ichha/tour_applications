// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/business_logics/auth.dart';
import 'package:tour_application/const/app_color.dart';
import 'package:tour_application/ui/routes/route.dart';
import 'package:tour_application/ui/styles/styles.dart';
import 'package:tour_application/ui/widgets/violet_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, top: 80.h, right: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create\nYour Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.sp,
                    color: AppColor.violetColor,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Create your account and start your journey",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 80.h),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: AppStyles.textFieldInputDecoration(
                    hintText: "Enter your email",
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: AppStyles.textFieldInputDecoration(
                    hintText: "Enter your password",
                  ),
                ),
                SizedBox(height: 50.h),
                VioletButton(
                  buttonText: "Create Account",
                  onTap: () => Auth().registration(
                    _emailController.text,
                    _passwordController.text,
                    context,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Text("--OR--"),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Image.asset(
                        'assets/icons/google.png',
                        height: 35.h,
                        width: 35.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Image.asset(
                        'assets/icons/facebook.png',
                        height: 35.h,
                        width: 35.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already an User? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(signIn),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColor.violetColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
