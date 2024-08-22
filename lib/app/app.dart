

import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/config/app_config.dart';
import '../core/ui/themes/themes.dart';
import '../core/values/flavor/flavor.dart';
import 'routes/app_pages.dart';
import 'translations.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppConfig config = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey:
          AppConfig.instance.flavor == AppFlavor.dev && !GetPlatform.isWeb
              ? Get.find<Alice>().getNavigatorKey()
              : null,
      title: config.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
      getPages: AppPages.routes,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
    );
  }
}
