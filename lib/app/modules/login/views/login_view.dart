// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              "LOGIN",
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
              hintText: "Email",
              controller: controller.email,
              isMultiLine: false,
            ),
            ReusableTextField(
              hintText: "Password",
              controller: controller.password,
              isMultiLine: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              function: () {
                controller.onLogin();
              },
              title: 'Login',
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP);
                },
                child: Text("Don't have an account")),
          ],
        ),
      )),
    );
  }
}
