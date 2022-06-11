import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isMultiLine;
  const ReusableTextField(
      {required this.controller,
      required this.hintText,
      Key? key,
      required this.isMultiLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiLine ? 200.h : 55.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: TextField(
        maxLines: isMultiLine ? null : 1,
        controller: controller,
        keyboardType: isMultiLine ? TextInputType.multiline : null,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
      ),
    );
  }
}
