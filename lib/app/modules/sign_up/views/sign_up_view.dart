import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Sign Up",
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReusableTextField(
                  controller: controller.fullName,
                  hintText: "Full Name",
                  isMultiLine: false,
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
                    controller.onCreateAccount();
                  },
                  title: 'Sign Up',
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text("Already have an account")),
              ],
            ),
          )),
    );
  }
}
