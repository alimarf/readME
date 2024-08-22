// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// import '../../../../../core/ui/colors/colors.dart';
// import '../../../../../core/ui/constants/sizes.dart';
// import '../../../../../core/ui/widgets/atoms/button/a_primary_button.dart';
// import '../../../../../core/ui/widgets/atoms/button/a_secondary_button.dart';
// import '../../../../../core/ui/widgets/atoms/gap/a_gap.dart';
// import '../../../../../core/ui/widgets/atoms/image/a_image.dart';
// import '../../../../../core/ui/widgets/organigrams/scaffold/o_scaffold.dart';
// import '../../../../../core/values/state/app_state.dart';
// import 'camera_utils.dart';
// import 'camera_viewer_controller.dart';

// class CameraViewerView extends GetView<CameraViewerController> {
//   const CameraViewerView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OScaffold(
//       showBackground: false,
//       backgroundColor: AppColors.white,
//       body: Obx(
//         () => Stack(
//           children: [
//             Container(
//                 height: Get.context!.height,
//                 width: Get.context!.width,
//                 padding: const EdgeInsets.only(top: AppSizes.padding),
//                 child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(children: [
//                       Container(
//                           width: context.width,
//                           decoration:
//                               const BoxDecoration(color: AppColors.white),
//                           padding: const EdgeInsets.symmetric(
//                               vertical: AppSizes.extraLargeMargin),
//                           child: Row(
//                             children: [
//                               InkWell(
//                                 child: Icon(
//                                   LucideIcons.chevronLeft,
//                                   color: AppColors.black,
//                                 ),
//                                 onTap: Get.back,
//                               ),
//                               AGap(
//                                 width: AppSizes.margin,
//                               ),
//                               Expanded(
//                                   child: Text(
//                                 controller.label.value ?? '-',
//                                 style: Get.context!.textTheme.titleMedium,
//                               ))
//                             ],
//                           )),
//                       if (controller.cameraState.value ==
//                           CameraState.takePicture)
//                         Stack(
//                           children: [
//                             controller.isCameraInitialized.isTrue &&
//                                     controller.cameraController != null
//                                 ? AspectRatio(
//                                     aspectRatio: 1 /
//                                         controller.cameraController!.value
//                                             .aspectRatio,
//                                     child: CameraPreview(
//                                         controller.cameraController!),
//                                   )
//                                 : const Center(
//                                     child: CircularProgressIndicator()),
//                             if (controller.frame.value != null &&
//                                 controller.takePictureState.value !=
//                                     AppState.Loading)
//                               Positioned(
//                                   top: 150,
//                                   left: AppSizes.largeMargin,
//                                   right: AppSizes.largeMargin,
//                                   child: Image.asset(
//                                     controller.frame.value!,
//                                     fit: BoxFit.cover,
//                                   )),
//                           ],
//                         )
//                       else
//                         AImage(
//                           source: ImageSource.File,
//                           height: context.height - 250,
//                           path: controller.result.value.path,
//                         )
//                     ]))),
//             if (controller.screenshotState.value != AppState.Loading)
//               Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     padding: const EdgeInsets.all(AppSizes.padding),
//                     child: controller.cameraState.value ==
//                             CameraState.takePicture
//                         ? APrimaryButton(
//                             text: 'Ambil foto',
//                             prefixIcon: const Icon(
//                               LucideIcons.camera,
//                               color: AppColors.white,
//                             ),
//                             onClick: controller.takePicture,
//                             isLoading: controller.takePictureState.value ==
//                                 AppState.Loading,
//                           )
//                         : Column(children: [
//                             APrimaryButton(
//                               text: 'Konfirmasi',
//                               prefixIcon: const Icon(
//                                 LucideIcons.check,
//                                 color: AppColors.white,
//                               ),
//                               onClick: controller.confirm,
//                             ),
//                             AGap(
//                               height: AppSizes.margin,
//                             ),
//                             ASecondaryButton(
//                               text: 'Ulangi',
//                               prefixIcon: const Icon(
//                                 LucideIcons.refreshCcw,
//                                 color: AppColors.primaryDark,
//                               ),
//                               backgroundColor: AppColors.white,
//                               onClick: controller.resetTakePicture,
//                               isLoading: controller.takePictureState.value ==
//                                   AppState.Loading,
//                             )
//                           ]),
//                   ))
//           ],
//         ),
//       ),
//     );
//   }
// }
