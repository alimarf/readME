// import 'dart:developer';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:get/get.dart';
// import 'package:image/image.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../../../../core/base/base_controller.dart';
// import '../../../../../core/values/state/app_state.dart';
// import 'camera_result.dart';
// import 'camera_utils.dart';

// class CameraViewerController extends BaseController {
//   final takePictureState = Rx<AppState>(AppState.Initial);
//   final screenshotState = Rx<AppState>(AppState.Initial);
//   final cameraState = Rx<CameraState>(CameraState.takePicture);

//   // final direction = Rx<CameraLensDirection>(CameraLensDirection.back);
//   final isCameraInitialized = RxBool(false);

//   final imagePath = Rxn<String>();
//   final address = Rxn<String>();
//   final title = Rxn<String>();
//   final label = Rxn<String>();
//   final frame = Rxn<String>();
//   final result = Rx<CameraResult>(CameraResult());

//   CameraController? cameraController;

//   @override
//   void onReady() async {
//     title.value = Get.arguments['title'] ?? '';
//     label.value = Get.arguments['label'] ?? '';
//     direction.value = Get.arguments['direction'] ?? CameraLensDirection.back;
//     frame.value = Get.arguments['frame'];

//     final cameras = await availableCameras();
//     final cameraDescription =
//         cameras.firstWhere((camera) => camera.lensDirection == direction.value);
//     cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.veryHigh,
//       imageFormatGroup: ImageFormatGroup.yuv420,
//       enableAudio: false,
//     );
//     await cameraController?.initialize();
//     cameraController?.setFlashMode(FlashMode.off);
//     isCameraInitialized.value = true;
//   }

//   @override
//   void onClose() {
//     cameraController?.dispose();
//   }

//   void takePicture() async {
//     try {
//       takePictureState.value = AppState.Loading;

//       final picture = await cameraController?.takePicture();
//       final temporaryDirectory = await getApplicationDocumentsDirectory();
//       final temporaryFile = File(
//           '${temporaryDirectory.path}/${DateTime.now().toIso8601String()}.jpg');

//       if (picture != null) {
//         takePictureState.value = AppState.LoadComplete;
//         final compressedImage = await FlutterImageCompress.compressAndGetFile(
//           (picture as XFile).path,
//           temporaryFile.path,
//           quality: 80,
//         );
//         result.value.path = compressedImage?.path;
//         getImageInfo(compressedImage!.path);
//         cameraState.value = CameraState.preview;
//       } else {
//         takePictureState.value = AppState.Initial;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   void getImageInfo(String imagePath) async {
//     // Read the image file
//     final file = File(imagePath);
//     final bytes = await file.readAsBytes();

//     // Decode the image
//     final image = decodeImage(bytes);

//     final fileSizeInBytes = await file.length();
//     final fileSizeInKB = fileSizeInBytes / 1024;
//     final fileSizeInMB = fileSizeInKB / 1024;
//     log('File size: $fileSizeInBytes bytes');
//     log('File size: $fileSizeInKB KB');
//     log('File size: $fileSizeInMB MB');

//     if (image != null) {
//       // Get the width and height
//       final width = image.width;
//       final height = image.height;
//       log('Image resolution: ${width}x${height}');
//     } else {
//       log('Failed to decode the image.');
//     }
//   }

//   void confirm() {
//     Get.back(result: result.value);
//   }

//   void resetTakePicture() {
//     takePictureState.value = AppState.Initial;
//     cameraState.value = CameraState.takePicture;
//   }
// }
