import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/colors.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.onMaleTap,
    required this.onFemaleTap,
    required this.gender,
  });

  final VoidCallback onMaleTap;
  final VoidCallback onFemaleTap;
  final int gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor:
                  gender == 1 ? AppColors.C_6C63FF : AppColors.white),
          onPressed: onMaleTap,
          child: Text(
            "MALE",
            style: TextStyle(
                color: gender == 1 ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 15.sp),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor:
                  gender == 0 ? AppColors.C_6C63FF : AppColors.white),
          onPressed: onFemaleTap,
          child: Text(
            "FEMALE",
            style: TextStyle(
                color: gender == 0 ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 15.sp),
          ),
        ),
      ],
    );
  }
}
