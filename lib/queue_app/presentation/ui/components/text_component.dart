
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textComponent(BuildContext context, String textVal, String fontFamily, Color color, [FontWeight fontWeight = FontWeight.normal, double fontSize = 20]) {
  return Text(textVal, style: TextStyle(fontSize: fontSize.sp,fontFamily: fontFamily, fontWeight: fontWeight,color: color),);
}