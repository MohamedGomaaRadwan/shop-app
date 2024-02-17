import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  AppPadding({super.key, required this.child, this.padding});
  final Widget child;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding??const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}
