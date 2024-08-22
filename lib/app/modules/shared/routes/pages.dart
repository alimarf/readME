import 'package:get/get.dart';

import '../presentation/image_viewer/image_viewer_binding.dart';
import '../presentation/image_viewer/image_viewer_view.dart';
import '../presentation/information/information_binding.dart';
import '../presentation/information/information_view.dart';
import '../presentation/web_viewer/web_viewer_binding.dart';
import '../presentation/web_viewer/web_viewer_view.dart';

part 'routes.dart';

class SharedPages {
  SharedPages._();

  static final routes = [
    GetPage(
      name: _SharedPaths.INFORMATION,
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _SharedPaths.IMAGE_VIEWER,
      page: () => const ImageViewerView(),
      binding: ImageViewerBinding(),
    ),
    // GetPage(
    //   name: _SharedPaths.CAMERA_VIEWER,
    //   page: () => const CameraViewerView(),
    //   binding: CameraViewerBinding(),
    // ),
    GetPage(
      name: _SharedPaths.WEB_VIEWER,
      page: () => const WebViewerView(),
      binding: WebViewerBinding(),
    ),
  ];
}
