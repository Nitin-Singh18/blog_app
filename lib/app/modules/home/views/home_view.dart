import 'package:blog_app/app/data/global_widgets/post.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Blog App",
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.PROFILE);
                        },
                        icon: Icon(
                          Icons.account_circle,
                          size: 30.h,
                        ))
                  ]),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(child: GetBuilder<HomeController>(
              builder: (value) {
                if (value.blogs.isNotEmpty) {
                  return ListView.builder(
                      controller: controller.controller,
                      itemCount: value.blogs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 5.h),
                            child: Post(
                              isPopUpMenuEnabled: false,
                              model: value.blogs[index],
                            ));
                      });
                } else {
                  return Center(
                    child: Text("No Blogs Available"),
                  );
                }
              },
            )),
            Obx(() {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: 60.h,
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return SizedBox();
              }
            })
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(Routes.UPLOAD_BLOG);
          },
          label: Row(
            children: [
              Icon(
                Icons.upload,
                size: 24.sp,
              ),
              SizedBox(width: 5.w),
              Text(
                "Create Blog",
                style: TextStyle(fontSize: 15.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
