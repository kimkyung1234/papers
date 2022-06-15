import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.fontFamily = 'Comfortaa',
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
