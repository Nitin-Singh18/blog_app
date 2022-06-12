// ignore_for_file: prefer_const_constructors

import 'package:blog_app/app/models/blog_model.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Post extends StatelessWidget {
  final BlogsModel model;
  final bool isPopUpMenuEnabled;
  const Post({Key? key, required this.model, required this.isPopUpMenuEnabled})
      : super(key: key);

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(model.image)),
                ),
                alignment: Alignment.topRight,
                child: isPopUpMenuEnabled
                    ? Padding(
                        padding: EdgeInsets.all(10.r),
                        child: PopupMenuButton(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Edit"),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text("Delete"),
                              value: 1,
                            )
                          ],
                        ),
                      )
                    : SizedBox()),
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
