// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/const/app_color.dart';
import 'package:tour_application/const/app_strings.dart';
import 'package:tour_application/ui/routes/route.dart';
import 'package:tour_application/ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp( App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "Shelter",
    options: FirebaseOptions(
      apiKey: "AIzaSyAMJLQfqyi3Mbw_Z-hzlXUGMhEb0B0Y8Yw",
      appId: "1:878564371227:android:06c6b19d1ae7bd42ad41be",
      messagingSenderId: "878564371227",
      projectId: "tour-application-project",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
            scaffoldBackgroundColor: AppColor.scaffoldColor,
          ),
          initialRoute: splash,
          getPages: pages,
          home: SplashScreen(),
        );
      },
    );
  }
}
