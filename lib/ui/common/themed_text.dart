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
    this.maxLines,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign textAlign;
  final int? maxLines;

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
      maxLines: maxLines,
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

class TextHeader extends StatelessWidget {
  const TextHeader({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
        child: TextFont(text: text, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}

