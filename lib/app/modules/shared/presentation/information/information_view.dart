import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/constants/sizes.dart';
import '../../../../../core/ui/widgets/atoms/button/a_primary_button.dart';
import '../../../../../core/ui/widgets/atoms/gap/a_gap.dart';
import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
import 'information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      showBackground: false,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Icon(LucideIcons.alertCircle, color: AppColors.black, size: 120,),
          AGap(height: AppSizes.extraLargeMargin),
          Text(
            controller.title ?? '',
            style: context.textTheme.titleMedium,
          ), 
          AGap(height: AppSizes.margin),
          Text(
            controller.description ?? '',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
          const Spacer(),
          APrimaryButton(
            text: controller.navigationLabel,
            suffixIcon: const Icon(
              UniconsLine.arrow_right,
              size: 18,
            ),
            onClick: controller.goToDestination,
          ),
        ],
      ),
    ));
  }
}
