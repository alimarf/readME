// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ASkeleton extends StatelessWidget {
  bool isLoading;
  Widget child;

  ASkeleton(
      {Key? key,
      required this.isLoading,
      required this.child,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: child,
    );
  }
}
