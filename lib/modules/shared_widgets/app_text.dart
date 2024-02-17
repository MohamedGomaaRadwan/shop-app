import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final double height;
  const AppText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textDecoration,
    this.maxLines,
    this.overflow,
    this.textStyle,
    this.height = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      overflow: overflow,
      style: textStyle,
      maxLines: maxLines,
      textAlign: textAlign,
      strutStyle: StrutStyle(
        height: height,
        forceStrutHeight: true,
      ),
    );
  }
}
