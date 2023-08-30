import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medium_project/data/models/website/website_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../utils/colors/colors.dart';

class GlobalContainer extends StatelessWidget {
  const GlobalContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: AppColors.C_6C63FF, blurRadius: 3.r),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              fontFamily: "Poppins",
              color: Colors.black),
        ),
      ),
    );
  }
}
