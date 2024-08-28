
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queue_app/queue_app/presentation/shared/constants/app_constants.dart';

Widget buttonContainer(BuildContext context, double height, double width, Color backGround, Color shadow, Widget children, Function goTo, [double hPadding = 15, double vPadding = 10]) {
  return Bounceable(
    duration: const Duration(milliseconds: 500),
    onTap: () async {
      await Future.delayed(const Duration(milliseconds: 500));
      goTo();
    },
    child: Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: hPadding.w,vertical: vPadding.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.appRadius),
        color: backGround,
        boxShadow: [
          BoxShadow(color: shadow, blurRadius: 15.0,
              offset: const Offset(0.0, 0.75)),
        ],
      ),
      child: Center(child: children),
    ),
  );
}

Widget justContainer(BuildContext context, double height, double width, Color backGround, Color shadow, Widget children) {
  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppConstants.appRadius),
      color: backGround,
      boxShadow: [
        BoxShadow(color: shadow, blurRadius: 15.0,
            offset: const Offset(0.0, 0.75)),
      ],
    ),
    child: Center(child: children),
  );
}

