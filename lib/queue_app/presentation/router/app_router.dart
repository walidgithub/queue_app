import 'package:flutter/material.dart';
import 'package:queue_app/queue_app/presentation/router/arguments.dart';
import 'package:queue_app/queue_app/presentation/ui/customer_category/customer_category_view.dart';
import 'package:queue_app/queue_app/presentation/ui/customer_details/customer_details_view.dart';
import 'package:queue_app/queue_app/presentation/ui/language/language_view.dart';
import 'package:queue_app/queue_app/presentation/ui/printing/printing_view.dart';
import 'package:queue_app/queue_app/presentation/ui/service_category/service_category_view.dart';
import '../ui/printing/printer_services/print_preview_screen.dart';
import '../ui/settings/settings_view.dart';

class Routes {
  static const String languageRoute = "/language";
  static const String customerCategoryRoute = "/customerCategory";
  static const String serviceCategoryRoute = "/serviceCategory";
  static const String customerDetailsRoute = "/customerDetails";
  static const String printingRoute = "/printing";
  static const String settingsRoute = "/settings";
  static const String previewRoute = "/preview";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguageView());
      case Routes.customerCategoryRoute:
        return MaterialPageRoute(builder: (_) => const CustomerCategoryView());
      case Routes.serviceCategoryRoute:
        return MaterialPageRoute(builder: (_) => const ServiceCategoryView());
      case Routes.customerDetailsRoute:
        return MaterialPageRoute(builder: (_) => const CustomerDetailsView());
      case Routes.printingRoute:
        return MaterialPageRoute(builder: (_) => const PrintingView());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingView());
      case Routes.previewRoute:
        return MaterialPageRoute(builder: (_) => PrintPreviewScreen(arguments: settings.arguments as PreviewData));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
          body: Container()),
    );
  }
}