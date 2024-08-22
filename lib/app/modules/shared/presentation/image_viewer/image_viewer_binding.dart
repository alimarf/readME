import 'package:get/get.dart';

import 'image_viewer_controller.dart';

class ImageViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageViewerController>(
      () => ImageViewerController(),
    );
  }
}
