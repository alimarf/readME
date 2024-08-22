part of 'pages.dart';

abstract class SharedRoutes {
  SharedRoutes._();

  static const IMAGE_VIEWER = _SharedPaths.IMAGE_VIEWER;
  static const CAMERA_VIEWER = _SharedPaths.CAMERA_VIEWER;
  static const GEO_TAGGING = _SharedPaths.GEO_TAGGING;
  static const WEB_VIEWER = _SharedPaths.WEB_VIEWER;
  static const INFORMATION = _SharedPaths.INFORMATION;
  static const SIGNATURE = _SharedPaths.SIGNATURE;
}

abstract class _SharedPaths {
  _SharedPaths._();

  static const IMAGE_VIEWER = '/image-viewer';
  static const CAMERA_VIEWER = '/camera-viwer';
  static const GEO_TAGGING = '/geo-tagging';
  static const WEB_VIEWER = '/web-viewer';
  static const INFORMATION = '/information';
  static const SIGNATURE = '/signature';
}
