import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(children: [
        BackButton(),
        SizedBox(
          width: 60.w,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}
