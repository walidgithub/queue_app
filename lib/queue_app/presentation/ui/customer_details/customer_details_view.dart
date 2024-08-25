import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/app_router.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/constants/app_strings.dart';
import '../../shared/style/app_colors.dart';
import '../../shared/style/app_fonts.dart';
import '../../shared/utils/functions.dart';
import '../components/button_container.dart';
import '../components/text_component.dart';

class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onBackButtonPressed(context),
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
                child: Scaffold(
                  body: bodyContent(context),
                ))));
  }

  Widget bodyContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textComponent(context, AppStrings.customerDetailAr,
                AppFonts.englishFontFamily, AppColors.black, FontWeight.bold, 40.sp),
            textComponent(context, AppStrings.customerDetails,
                AppFonts.englishFontFamily, AppColors.black, FontWeight.bold, 40.sp),
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 300.h,
              width: MediaQuery.sizeOf(context).width * 0.9.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.appRadius),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: AppColors.shadow,
                      blurRadius: 15.0,
                      offset: const Offset(0.0, 0.75)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  justContainer(
                      context,
                      75.h,
                      MediaQuery.sizeOf(context).width * 0.8.w,
                      AppColors.backGround,
                      AppColors.shadow,
                  textComponent(
                      context,
                      'Name',
                      AppFonts.englishFontFamily,
                      AppColors.black,
                      FontWeight.bold,
                      18.sp)),
                  justContainer(
                      context,
                      75.h,
                      MediaQuery.sizeOf(context).width * 0.8.w,
                      AppColors.backGround,
                      AppColors.shadow,
                      textComponent(
                          context,
                          'Name',
                          AppFonts.englishFontFamily,
                          AppColors.black,
                          FontWeight.bold,
                          18.sp)),
                  buttonContainer(
                      context,
                      75.h,
                      MediaQuery.sizeOf(context).width * 0.8.w,
                      AppColors.primary,
                      AppColors.shadow,
                      textComponent(
                          context,
                          'Category 4',
                          AppFonts.englishFontFamily,
                          AppColors.backGround,
                          FontWeight.bold,
                          18.sp),(){
                    Navigator.pushReplacementNamed(context, Routes.printingRoute);
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
