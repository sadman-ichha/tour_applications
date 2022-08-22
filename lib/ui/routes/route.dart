// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:tour_application/ui/views/auth/sign_in.dart';
import 'package:tour_application/ui/views/auth/sign_up.dart';
import 'package:tour_application/ui/views/auth/user_form.dart';
import 'package:tour_application/ui/views/onboarding_screen.dart';
import 'package:tour_application/ui/views/privacy_policy.dart';
import 'package:tour_application/ui/views/splash_screen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signUp = "/signUp-screen";
const String signIn = "/signIn-screen";
const String userForm = "/user-form-screen";
const String privacyPolicy = "/privacy-policy-screen";

List<GetPage> pages = [
  GetPage(name: splash, page: ()=> SplashScreen()),
  GetPage(name: onboarding, page: ()=> OnboardingScreen()),
  GetPage(name: signUp, page: ()=> SignUpScreen()),
  GetPage(name: signIn, page: ()=> SignInScreen()),
  GetPage(name: userForm, page: ()=> UserFromScreen()),
  GetPage(name: privacyPolicy, page: ()=> PrivacyPolicyScreen()),
];