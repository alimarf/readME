import 'package:get/get.dart';

import 'web_viewer_controller.dart';

class WebViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewerController>(
      () => WebViewerController(),
    );
  }
}
