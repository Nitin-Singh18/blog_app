import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const ReusableTextField(
      {required this.controller, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
      ),
    );
  }
}
