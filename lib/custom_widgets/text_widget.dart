import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final Padding? padding;

  const TextTitle({
    required this.title,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'EB Garamond',
        fontSize: fontSize ?? 23,
        color: color ?? Colors.white,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
