import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function function;
  const CustomButton({Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.r, vertical: 8.r),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(6)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ),
    );
  }
}
