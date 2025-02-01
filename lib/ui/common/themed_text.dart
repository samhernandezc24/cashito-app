import 'package:cashito_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TextFont extends StatelessWidget {
  const TextFont({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.textColor,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    Color? finalTextColor;

    if (textColor == null) {
      finalTextColor = Theme.of(context).colorScheme.black;
    } else {
      finalTextColor = textColor;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: 'Font72',
        color: finalTextColor,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.double,
        decorationColor: Color(0x00FFFFFF),
      ),
    );
  }
}
