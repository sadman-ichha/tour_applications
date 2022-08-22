// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/business_logics/user_form.dart';
import 'package:tour_application/const/app_color.dart';
import 'package:tour_application/ui/styles/styles.dart';
import 'package:tour_application/ui/widgets/violet_button.dart';

class UserFromScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

  final Rx<TextEditingController> _dobController = TextEditingController().obs;
  final Rx<DateTime> dateTime = DateTime.now().obs;
  String? dob;
  String gender = "Male";

  _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: dateTime.value,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null && selectedDate != dateTime) {
      dob = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      _dobController.value.text = dob!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell Us More About You",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: AppColor.violetColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "We will not share your information\noutside this application.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 60.h),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: AppStyles.textFieldInputDecoration(
                    hintText: "Full Name",
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: AppStyles.textFieldInputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: AppStyles.textFieldInputDecoration(
                    hintText: "Address",
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => TextFormField(
                    controller: _dobController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(fontSize: 20.sp),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  activeBgColor: [Color(0xFFFC4646)],
                  inactiveFgColor: Colors.white.withOpacity(.60),
                  labels: ['MALE', 'FEMALE'],
                  onToggle: (index) {
                    if (index == 0) {
                      gender = "Male";
                    } else {
                      gender = "Female";
                    }
                    print("Index: $gender");
                  },
                ),
                SizedBox(height: 140.h),
                VioletButton(
                  buttonText: "Submit",
                  onTap: () {
                    UsersInfo().sendFormDataToDB(
                      _nameController.text,
                      int.parse(_phoneNumberController.text),
                      _addressController.text,
                      dob!,
                      gender,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
