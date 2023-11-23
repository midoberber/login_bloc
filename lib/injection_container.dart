import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_with_bloc/core/app/app_preferences_storage.dart';
import 'package:login_with_bloc/core/app/app_repository.dart';
import 'package:login_with_bloc/core/utils/api_basehelper.dart';
import 'package:login_with_bloc/core/utils/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app/app_inj.dart';

final sl = GetIt.instance;
final ApiBaseHelper helper = ApiBaseHelper();
Future<void> init() async {
  initAppMainjection(sl);
  // initAuthinjection(sl);

  // core

  sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  //FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  //sl.registerLazySingleton<FirebaseMessaging>(() => firebaseMessaging);
  final references = await Preferences.getInstance();

  const loc = Localizations;
  sl.registerLazySingleton(() => references);

  sl.registerLazySingleton(() => loc);
  sl.registerLazySingleton(() => AppRepository(references));
  helper.dioInit();
  sl.registerLazySingleton(() => helper);
}
