enum CameraState {
  takePicture(1, "house"),
  preview(2, "job");

  final int status;
  final String text;
  const CameraState(
    this.status,
    this.text,
  );
}