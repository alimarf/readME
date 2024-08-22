import 'dart:developer';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/base/base_controller.dart';

class WebViewerController extends BaseController {
  final WebViewController webViewController = WebViewController();

  final title = RxString('');
  final keyword = RxString('');
  final url = RxString('');

  @override
  void onReady() {
    super.onReady();
    title.value = Get.parameters['title']!;
    keyword.value = Get.parameters['keyword'] ?? '';
    url.value = Get.parameters['url']!;

    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.loadRequest(Uri.parse(url.value));
    webViewController
        .setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
      log('started url: $url');
      if (keyword.isNotEmpty && url.contains(keyword)) {
        final formattedUri = Uri.parse(
            Uri.decodeComponent(url.toString().replaceAll('&amp;', '&')));
        Get.back<dynamic>(result: formattedUri.queryParameters);
      }
    }));
  }
}
