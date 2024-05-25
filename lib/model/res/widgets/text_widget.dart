import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool isBold;
  final bool italic;
  final TextAlign? textAlignment;
  final fontFamily;
  final textDecoration;
  final underlineColor;
  final TextOverflow? overflow;

  const TextWidget({
    super.key,
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.isBold = false,
    this.fontFamily = '',
    this.underlineColor = Colors.grey,
    this.textAlignment,
    this.textDecoration = TextDecoration.none,
    this.italic = false,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlignment ?? TextAlign.start,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          fontFamily: fontFamily,
          decoration: textDecoration,
          decorationColor: underlineColor),
    );
  }
}
