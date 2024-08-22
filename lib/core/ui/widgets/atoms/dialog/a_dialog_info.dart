import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';
import '../button/a_primary_button.dart';

void showInfoDialog(String message) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              color: AppColors.gray.shade800,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.gray.shade800,
              ),
            ),
            const SizedBox(height: 24),
            APrimaryButton(
              text: 'Close',
              onClick: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
