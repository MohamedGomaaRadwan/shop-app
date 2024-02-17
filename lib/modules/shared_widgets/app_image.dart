import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.boxFit,
    this.height,
    this.width,
  });
  final String path;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(shape: Border.symmetric()),
      child: Image.asset(
        path,
        fit: boxFit,
        errorBuilder: (_, __, ___) => _errorImageLoad(),
      ),
    );
  }

  Center _errorImageLoad() => const Center(child: Icon(Icons.error));
}
