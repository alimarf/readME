import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/widgets/moleculs/m_app_bar/m_app_bar.dart';
import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
import 'web_viewer_controller.dart';

class WebViewerView extends GetView<WebViewerController> {
  const WebViewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => OScaffold(
          appBar: MAppBar.primary(
            title: controller.title.value,
          ),
          showBackground: false,
          backgroundColor: AppColors.transparent,
          body: WebViewWidget(controller: controller.webViewController),
        ));
  }
}
