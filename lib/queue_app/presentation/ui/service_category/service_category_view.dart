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

class ServiceCategoryView extends StatefulWidget {
  const ServiceCategoryView({Key? key}) : super(key: key);

  @override
  State<ServiceCategoryView> createState() => _ServiceCategoryViewState();
}

class _ServiceCategoryViewState extends State<ServiceCategoryView> {
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
              textComponent(context, AppStrings.serviceCategoryAr,
                  AppFonts.arabicFontFamily, AppColors.black, FontWeight.bold, 30.sp),
              textComponent(context, AppStrings.serviceCategory,
                  AppFonts.englishFontFamily, AppColors.black, FontWeight.bold, 30.sp),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
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
                    ListView.separated(
                        separatorBuilder: (context,index) {
                          return SizedBox(
                            height: 15.h,
                          );
                        },
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context,index) {
                          return buttonContainer(
                              context,
                              60.h,
                              MediaQuery.sizeOf(context).width * 0.8.w,
                              AppColors.primary,
                              AppColors.shadow,
                              textComponent(
                                  context,
                                  'Service ${index + 1} ',
                                  AppFonts.arabicFontFamily,
                                  AppColors.backGround,
                                  FontWeight.normal,
                                  18.sp),(){
                            Navigator.pushReplacementNamed(context, Routes.customerDetailsRoute);
                          });
                        }),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
