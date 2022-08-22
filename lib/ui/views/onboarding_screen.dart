// ignore_for_file: unrelated_type_equality_checks

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_application/const/app_color.dart';
import 'package:tour_application/ui/routes/route.dart';
import 'package:tour_application/ui/styles/styles.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final List<String> _lottiefiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];
  final List<String> _title = ['Welcome', 'Categories', 'Support'];
  final List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(32.h),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottiefiles[_currentIndex.toInt()]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.scaffoldColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.r,
                        spreadRadius: 1.r,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 7.r,
                        spreadRadius: 1.r,
                      ),
                    ],
                  ),
                  child: Obx(
                    () => Padding(
                      padding: EdgeInsets.all(30.h),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _title[_currentIndex.value],
                            style: AppStyles.myTextStyle,
                          ),
                          SizedBox(height: 15.h),
                          Text(_description[_currentIndex.value]),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DotsIndicator(
                                dotsCount: _lottiefiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(_currentIndex == _lottiefiles.length-1){
                                    Get.offAllNamed(signUp);
                                  }else{
                                    _currentIndex+1;
                                  }
                                },
                                child: Container(
                                  height: 37.h,
                                  width: 37.w,
                                  decoration: BoxDecoration(
                                    color: AppColor.scaffoldColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 10.r,
                                        spreadRadius: 1.r,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4.0, -4.0),
                                        blurRadius: 7.r,
                                        spreadRadius: 1.r,
                                      ),
                                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
