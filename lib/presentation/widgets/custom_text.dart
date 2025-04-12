import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.minFontSize,
    this.maxLines,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  final String? text;
  final double? fontSize;
  final double? minFontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text ?? "",
      maxLines: maxLines ?? 1,
      minFontSize: minFontSize ?? 8,
      maxFontSize: fontSize ?? 15,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
      ),
    );
  }
}
