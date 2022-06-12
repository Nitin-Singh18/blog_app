import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/data/global_widgets/custom_button.dart';
import 'package:blog_app/app/data/global_widgets/text_field.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/upload_blog_controller.dart';

class UploadBlogView extends GetView<UploadBlogController> {
  BlogsModel? model = Get.arguments;
  @override
  Widget build(BuildContext context) {
    if (model != null) {
      controller.title = TextEditingController(text: model!.title);
      controller.description = TextEditingController(text: model!.description);
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CustomAppBar(title: model == null ? "Create Blog" : "Update Blog"),
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
              if (model == null) {
                controller.createBlog();
              } else {
                controller.editBlog(model!);
              }
            },
            title: model == null ? "Create Blog" : "Update Blog",
          ),
        ),
      ),
    );
  }
}
