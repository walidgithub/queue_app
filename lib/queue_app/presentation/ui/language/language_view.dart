import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:queue_app/queue_app/presentation/shared/constants/app_assets.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_colors.dart';

import '../../router/app_router.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/constants/app_strings.dart';
import '../../shared/style/app_fonts.dart';
import '../../shared/utils/functions.dart';
import '../components/button_container.dart';
import '../components/text_component.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onBackButtonPressed(context),
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
                child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(AppAssets.settings, width: 25.sp),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.settingsRoute);
                    },
                  )
                ],
              ),
              body: bodyContent(context),
            ))));
  }

  Widget bodyContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textComponent(
              context,
              AppStrings.selectLangAr,
              AppFonts.arabicFontFamily,
              AppColors.black,
              FontWeight.bold,
              AppConstants.titleFontSize),
          textComponent(
              context,
              AppStrings.selectLang,
              AppFonts.englishFontFamily,
              AppColors.black,
              FontWeight.bold,
              AppConstants.titleFontSize),
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: AppConstants.mainContainerHeight,
            width: AppConstants.mainContainerWidth,
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.mainContainerHPadding,
                vertical: AppConstants.mainContainerVPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.appRadius),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 0.75)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonContainer(
                    context,
                    AppConstants.btnHeight,
                    MediaQuery.sizeOf(context).width * 0.8.w,
                    AppColors.primary,
                    AppColors.shadow,
                    textComponent(
                        context,
                        AppStrings.arabic,
                        AppFonts.arabicFontFamily,
                        AppColors.backGround,
                        FontWeight.normal,
                        AppConstants.btnFontSize), () {
                  Navigator.pushReplacementNamed(
                      context, Routes.customerCategoryRoute);
                }),
                buttonContainer(
                    context,
                    AppConstants.btnHeight,
                    MediaQuery.sizeOf(context).width * 0.8.w,
                    AppColors.primary,
                    AppColors.shadow,
                    textComponent(
                        context,
                        AppStrings.english,
                        AppFonts.englishFontFamily,
                        AppColors.backGround,
                        FontWeight.bold,
                        AppConstants.btnFontSize), () {
                  Navigator.pushReplacementNamed(
                      context, Routes.customerCategoryRoute);
                }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
