import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVGImage extends StatelessWidget {
  const AppSVGImage(
      {Key? key,
      required this.image,
      this.boxFit,
      this.height,
      this.width,
        this.color,
      })
      : super(key: key);
  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.contain,color: color,
    );
  }
}
