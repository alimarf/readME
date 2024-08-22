enum AppFlavor {
  dev(1, "dev");

  final int id;
  final String text;
  const AppFlavor(
    this.id,
    this.text,
  );
}