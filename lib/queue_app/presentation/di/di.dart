

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/core/network/dio_manager.dart';
import '../shared/core/network/network_info.dart';
import '../shared/preferences/app_pref.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // app prefs instance
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // Dio
    sl.registerLazySingleton(() => DioManager());

    // Network Info
    sl.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(InternetConnectionChecker()));
  }
}