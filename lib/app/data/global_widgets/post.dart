import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Post extends StatelessWidget {
  final BlogsModel model;
  const Post({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.BLOG_DETAIL_SCREEN, arguments: model),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 200.h,
          width: 100.w,
          child: Column(children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 155.h,
              width: 320.w,
              decoration:
                  // ignore: prefer_const_constructors
                  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(model.image)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            )
          ]),
        ),
      ),
    );
  }
}
