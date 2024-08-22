import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      showBackground: false,
      backgroundColor: AppColors.primary.shade800,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('SPLASH',
                  style: Get.context!.textTheme.headlineLarge
                      ?.copyWith(color: AppColors.white))
              // AImage(
              //   source: ImageSource.Svg,
              //   url: './assets/icons/ic_feedback_white.svg',
              // ),
            ]),
      ),
    );
  }
}
