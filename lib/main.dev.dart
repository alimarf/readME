import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/app.dart';
import 'app/di.dart';
import 'app/initializer.dart';
import 'core/config/app_config.dart';
import 'core/values/flavor/flavor.dart';
import 'di.dart';
import 'initializer.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: "./environments/.env.dev");

    final appConfig = Get.put(
        AppConfig(
              flavor: AppFlavor.dev,
              appName: dotenv.get('APP_NAME'),
              appIcon: dotenv.get('APP_ICON'),
              // apiBaseUrl: dotenv.get('API_BASE_URL'),
              // storageUrl: dotenv.get('STORAGE_URL'),
              // connectionCheckerUrl: dotenv.get('CONNECTION_CHECKER_URL'),
              // storageKey: dotenv.get('STORAGE_KEY'),
              // defaultOrganizationCodeAdmin: dotenv.get('DEFAULT_ORGANIZATION_CODE_ADMIN'),
              // defaultSurveyCodeAdmin: dotenv.get('DEFAULT_SURVEY_CODE_ADMIN'),
              // organizationCode: dotenv.get('ORGANIZATION_CODE'), 
              // surveyCode: dotenv.get('SURVEY_CODE'),
            ),
        permanent: true);

    await Initializer(appConfig).run();
    await DependencyInjection(appConfig).init();

    await AppInitializer().run();
    await AppDependencyInjection().init();

    runApp(Sizer(builder: (context, orientation, deviceType) => App()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
