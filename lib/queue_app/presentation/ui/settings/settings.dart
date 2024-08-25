import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_colors.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_fonts.dart';
import 'package:queue_app/queue_app/presentation/ui/components/button_container.dart';
import 'package:queue_app/queue_app/presentation/ui/components/text_component.dart';

import '../../di/di.dart';
import '../../shared/constants/app_strings.dart';
import '../../shared/preferences/app_pref.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  static void show(BuildContext context) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => const SettingsDialog(),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  TextEditingController ipEditingController = TextEditingController();
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.backGround,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 5.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppColors.shadow),
              ),
            ),
            SizedBox(height: 20.h),
            textComponent(context, AppStrings.printerIp,
                AppFonts.englishFontFamily, AppColors.black,FontWeight.bold,30.sp),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 50.w,
                    child: TextField(
                        cursorColor: AppColors.backGround,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        controller: ipEditingController,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            hintText: 'Printer IP',
                            hintStyle: TextStyle(fontSize: 20),
                            labelText: 'Printer IP',
                            labelStyle:
                                TextStyle(fontSize: 20, color: Colors.black),
                            border: OutlineInputBorder())),
                  ),
                )
              ],
            ),
            SizedBox(height: 31.h),
            Row(
              children: [
                buttonContainer(
                    context,
                    50.h,
                    150.w,
                    AppColors.backGround,
                    AppColors.shadow,
                    textComponent(context, AppStrings.close,
                        AppFonts.englishFontFamily, AppColors.primary),
                    () {
                      SettingsDialog.hide(context);
                    }),
                const Spacer(),
                buttonContainer(
                    context,
                    50.h,
                    150.w,
                    AppColors.primary,
                    AppColors.shadow,
                    textComponent(context, AppStrings.save,
                        AppFonts.englishFontFamily, AppColors.backGround,FontWeight.bold),
                    () {
                      _appPreferences.setPrinterIP(
                          PREFS_KEY_IP, ipEditingController.text);
                      SettingsDialog.hide(context);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
