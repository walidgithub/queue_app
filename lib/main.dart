import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queue_app/queue_app/presentation/di/di.dart';
import 'package:queue_app/queue_app/presentation/router/app_router.dart';
import 'package:queue_app/queue_app/presentation/shared/constants/app_strings.dart';
import 'package:queue_app/queue_app/presentation/shared/style/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
  //   body: SafeArea(
  //     child: Scaffold(
  //       body: Center(
  //         child: Column(
  //           children: [
  //             Text(
  //               AppStrings.someThingWentWrong,
  //               style: TextStyle(color: AppColors.primary),
  //             ),
  //             SizedBox(
  //               height: AppConstants.heightBetweenElements,
  //             ),
  //             Text(
  //               details.exceptionAsString(),
  //               style: TextStyle(color: AppColors.primary),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.languageRoute,
      ),
    );
  }
}