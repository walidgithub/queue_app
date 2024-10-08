import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queue_app/queue_app/presentation/shared/constants/app_constants.dart';
import 'package:queue_app/queue_app/presentation/shared/constants/app_strings.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_colors.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_fonts.dart';
import 'package:screenshot/screenshot.dart';
import '../../router/app_router.dart';
import '../../router/arguments.dart';
import '../../shared/constants/app_assets.dart';
import '../../shared/utils/functions.dart';
import '../components/button_container.dart';
import '../components/text_component.dart';
import '../invoice/invoice_format/invoice_data.dart';
import '../invoice/invoice_generator.dart';

class PrintingView extends StatefulWidget {
  const PrintingView({super.key});

  @override
  State<PrintingView> createState() => _PrintingViewState();
}

class _PrintingViewState extends State<PrintingView> {
  ScreenshotController screenshotController = ScreenshotController();
  final data = InvoiceData.localInvoiceData();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onBackButtonPressed(context),
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
                child: Scaffold(
                    body: bodyContent(context),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () async {
                        await InvoiceGenerator.createInvoiceAndPrint(
                            context: context,
                            data: data
                        );
                      },
                      tooltip: 'Print',
                      child: const Icon(Icons.print),
                    )))));
  }

  Widget bodyContent(BuildContext context) {
    return Stack(
      children: [
        Screenshot(
          controller: screenshotController,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textComponent(
                      context,
                      AppStrings.print,
                      AppFonts.englishFontFamily,
                      AppColors.black,
                      FontWeight.bold,
                      AppConstants.titleFontSize),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: AppConstants.mainContainerHeight + 100.h,
                    width: AppConstants.mainContainerWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.mainContainerHPadding,
                      vertical: AppConstants.mainContainerVPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.appRadius),
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
                        justContainer(
                            context,
                            AppConstants.btnHeight,
                            MediaQuery.sizeOf(context).width * 0.8.w,
                            AppColors.backGround,
                            AppColors.shadow,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textComponent(
                                    context,
                                    AppStrings.ticketNumber,
                                    AppFonts.englishFontFamily,
                                    AppColors.black,
                                    FontWeight.bold,
                                    AppConstants.btnFontSize),
                                textComponent(
                                    context,
                                    '0',
                                    AppFonts.englishFontFamily,
                                    AppColors.black,
                                    FontWeight.bold,
                                    AppConstants.btnFontSize),
                              ],
                            )),
                        justContainer(
                            context,
                            AppConstants.btnHeight,
                            MediaQuery.sizeOf(context).width * 0.8.w,
                            AppColors.backGround,
                            AppColors.shadow,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textComponent(
                                    context,
                                    AppStrings.counterNumber,
                                    AppFonts.englishFontFamily,
                                    AppColors.black,
                                    FontWeight.bold,
                                    AppConstants.btnFontSize),
                                textComponent(
                                    context,
                                    '0',
                                    AppFonts.englishFontFamily,
                                    AppColors.black,
                                    FontWeight.bold,
                                    AppConstants.btnFontSize),
                              ],
                            )),
                        justContainer(
                            context,
                            AppConstants.btnHeight + 100.h,
                            MediaQuery.sizeOf(context).width * 0.8.w,
                            AppColors.backGround,
                            AppColors.shadow,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textComponent(
                                        context,
                                        AppStrings.customerCategory,
                                        AppFonts.englishFontFamily,
                                        AppColors.black,
                                        FontWeight.bold,
                                        AppConstants.btnFontSize),
                                    textComponent(
                                        context,
                                        ' \\ ',
                                        AppFonts.englishFontFamily,
                                        AppColors.black,
                                        FontWeight.bold,
                                        AppConstants.btnFontSize),
                                  ],
                                ),
                                textComponent(
                                    context,
                                    AppStrings.serviceCategory,
                                    AppFonts.englishFontFamily,
                                    AppColors.black,
                                    FontWeight.bold,
                                    AppConstants.btnFontSize),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10.h,
            left: 10.w,
            child: buttonContainer(
                context,
                40.w,
                40.w,
                AppColors.backGround,
                AppColors.shadow,
                SvgPicture.asset(AppAssets.home, width: 30.w), () {
              Navigator.pushReplacementNamed(context, Routes.languageRoute);
            }, 5.w, 5.h)),
        Positioned(
            bottom: 10.h,
            left: 100.w,
            child: buttonContainer(
                context,
                40.w,
                40.w,
                AppColors.backGround,
                AppColors.shadow,
                SvgPicture.asset(AppAssets.preview, width: 30.w), () {
              Navigator.pushNamed(context, Routes.previewRoute,
                  arguments:
                  PreviewData(context: context,data: data));
            }, 5.w, 5.h))
      ],
    );
  }
}
