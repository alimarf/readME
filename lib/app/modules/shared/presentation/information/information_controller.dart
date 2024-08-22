import 'package:get/get.dart';

import '../../../../../core/base/base_controller.dart';


class InformationController extends BaseController {
  final url = RxString('');

  String? title = Get.parameters['title'];
  String? description = Get.parameters['description'];
  String? navigationLabel = Get.parameters['navigation_label'];
  String? destination = Get.parameters['destination'];

  void goToDestination() {
    // Get.offAllNamed(destination ?? AuthRoutes.LOGIN);
  }
}
