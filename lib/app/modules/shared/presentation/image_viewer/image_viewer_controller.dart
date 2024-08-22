import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../../../core/base/base_controller.dart';
import '../../../../../core/ui/widgets/atoms/image/a_image.dart';

class ImageViewerController extends BaseController {
  final url = RxString('');
  final path = Rxn<String>();
  final bytes = Rxn<Uint8List>();
  final source = Rx<ImageSource>(ImageSource.Network);

  @override
  void onInit() {
    super.onInit();
    url.value = Get.arguments['url'] ?? '';
    path.value = Get.arguments['path'];
    bytes.value = Get.arguments['bytes'];
    source.value = Get.arguments['source'] ?? ImageSource.Network;
  }
}
