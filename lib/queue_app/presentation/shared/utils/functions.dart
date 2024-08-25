import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui/components/text_component.dart';
import '../constants/app_strings.dart';
import '../style/app_colors.dart';
import '../style/app_fonts.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: textComponent(context, AppStrings.warning,AppFonts.englishFontFamily,AppColors.black,FontWeight.bold,30.sp),
          content: textComponent(context, AppStrings.closeApp,AppFonts.englishFontFamily,AppColors.black,FontWeight.normal,20.sp),
          actions: [
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: textComponent(context, AppStrings.yes,AppFonts.englishFontFamily,AppColors.black,FontWeight.normal,18.sp)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: textComponent(context, AppStrings.no,AppFonts.englishFontFamily,AppColors.black,FontWeight.normal,18.sp)),
          ],
        );
      });
  return exitApp;
}
