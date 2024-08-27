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

class CustomerCategoryView extends StatefulWidget {
  const CustomerCategoryView({Key? key}) : super(key: key);

  @override
  State<CustomerCategoryView> createState() => _CustomerCategoryViewState();
}

class _CustomerCategoryViewState extends State<CustomerCategoryView> {
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
              textComponent(context, AppStrings.customerCategoryAr,
                  AppFonts.arabicFontFamily, AppColors.black, FontWeight.bold, AppConstants.titleFontSize),
              textComponent(context, AppStrings.customerCategory,
                  AppFonts.englishFontFamily, AppColors.black, FontWeight.bold, AppConstants.titleFontSize),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: AppConstants.mainContainerWidth,
                padding: EdgeInsets.symmetric(horizontal: AppConstants.mainContainerHPadding,vertical: AppConstants.mainContainerVPadding),
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
                              AppConstants.btnHeight,
                              MediaQuery.sizeOf(context).width * 0.8.w,
                              AppColors.primary,
                              AppColors.shadow,
                              textComponent(
                                  context,
                                  'Category ${index + 1} ',
                                  AppFonts.arabicFontFamily,
                                  AppColors.backGround,
                                  FontWeight.normal,
                                AppConstants.btnFontSize,),(){
                            Navigator.pushReplacementNamed(context, Routes.serviceCategoryRoute);
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
