import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Error",
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.C_273032,
            fontFamily: "Poppins"),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.C_273032,
              fontFamily: "Poppins"),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: Text(
            "Ok",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.C_273032,
                fontFamily: "Poppins"),
          ),
        )
      ],
    ),
  );
}

Future<void> showConfirmMessage({
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.C_273032,
              fontFamily: "Poppins"),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: Text(
            "Ok",
            style: TextStyle(
              fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.C_273032,
                fontFamily: "Poppins"),
          ),
        )
      ],
    ),
  );
}
