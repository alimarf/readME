import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../core/base/base_controller.dart';

class SplashController extends BaseController {
  final versionName = Rxn<String>();
  final buildNumber = Rxn<String>();

  final organizationCodeAdmin = Rxn<String>();
  final surveyCodeAdmin = Rxn<String>();

  SplashController();

  getApplicationVersion() => _getApplicationVersion();
  goToLogin() => _goToLogin();

  @override
  Future<void> onReady() async {
    super.onReady();

    // await Future.delayed(const Duration(seconds: 3));

    // goToLogin();
  }

  Future<void> fetchData() async {
    await getApplicationVersion();
  }

  Future<void> _getApplicationVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    versionName.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  void _goToLogin() {
    // Get.offAndToNamed(AuthRoutes.LOGIN);
  }
}
