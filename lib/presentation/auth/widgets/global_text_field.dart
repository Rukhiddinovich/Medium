import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.obscureText = false,
    this.maxLine = 1,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  final bool obscureText;
  final TextEditingController controller;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 6.r,
              offset: const Offset(5, 5),
            )
          ]),
      child: TextField(
        maxLines: maxLine,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontFamily: "Poppins"),
        textAlign: textAlign,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontFamily: "DMSans"),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
