import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AExpanded extends StatelessWidget {
  Widget child;

  AExpanded({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: child,
    );
  }
}
