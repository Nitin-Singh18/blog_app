import 'package:blog_app/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context) {
        return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes);
      },
    ),
  );
}
