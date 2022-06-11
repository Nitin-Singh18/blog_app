import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/upload_blog_controller.dart';

class UploadBlogView extends GetView<UploadBlogController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CustomAppBar(title: "Create Blog"),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
              controller: controller.title,
              hintText: "Title",
              isMultiLine: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            ReusableTextField(
                controller: controller.description,
                hintText: "Description",
                isMultiLine: true),
            SizedBox(
              height: 20.h,
            ),
            Container(
                height: 155..h,
                width: 330.w,
                alignment: Alignment.center,
                child: GetBuilder<UploadBlogController>(
                  builder: (value) {
                    if (value.imageFile != null) {
                      return Image.file(value.imageFile!);
                    } else {
                      return CustomButton(
                          title: "Upload Image",
                          function: () {
                            controller.pickImage();
                          });
                    }
                  },
                )),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: CustomButton(
            function: () {
              controller.createBlog();
            },
            title: "Create Blog",
          ),
        ),
      ),
    );
  }
}
