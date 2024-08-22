enum CameraSourceEnum {
  nmc(1, "NMC"),
  r2(3, "R2");

  final int id;
  final String text;
  const CameraSourceEnum(
    this.id,
    this.text,
  );
}