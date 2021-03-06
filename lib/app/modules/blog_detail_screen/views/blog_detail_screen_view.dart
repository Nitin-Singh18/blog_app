import 'package:blog_app/app/data/global_widgets/app_bar.dart';
import 'package:blog_app/app/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/blog_detail_screen_controller.dart';

class BlogDetailScreenView extends GetView<BlogDetailScreenController> {
  final BlogsModel model = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          CustomAppBar(title: ""),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.centerLeft,
            child: Text(
              model.title,
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 200.h,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                      model.image,
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.centerLeft,
            child: Text(
              model.description,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          )
        ]),
      ),
    );
  }
}
