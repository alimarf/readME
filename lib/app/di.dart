import 'package:alice/alice.dart';
import 'package:get/get.dart';

class AppDependencyInjection {
  AppDependencyInjection();

  Future<void> init() async {
    Alice? alice;

    if (!GetPlatform.isWeb) {
      alice = Alice(
          showInspectorOnShake: true,
          showShareButton: true,
          showNotification: true);
      await Get.putAsync<Alice>(() async => alice!);
    }
  }
}
