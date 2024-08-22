import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/widgets/atoms/center/a_center.dart';
import '../../../../../core/ui/widgets/atoms/image/a_image.dart';
import '../../../../../core/ui/widgets/atoms/sized_box/a_sized_box.dart';
import '../../../../../core/ui/widgets/moleculs/m_app_bar/m_app_bar.dart';
import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
import 'image_viewer_controller.dart';

class ImageViewerView extends GetView<ImageViewerController> {
  const ImageViewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      appBar: MAppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      showBackground: false,
      backgroundColor: AppColors.transparent,
      body: Obx(
        () => InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 8,
          child: ASizedBox(
              height: context.height,
              width: context.width,
              child: ACenter(
                child: AImage(
                  source: controller.source.value,
                  url: controller.url.value,
                  path: controller.path.value,
                ),
              )),
        ),
      ),
    );
  }
}
