import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StyledText extends StatelessWidget {
  final String styledString;
  final Color? styledColor;
  final double styledFontSize;
  final FontWeight? styledWeight;
  final FontStyle? styledStyle;
  final TextAlign? styledAlign;
  final int? textLineNumber;
  final double? letterSpace;
  final TextDecoration? styledDecoration;

  const StyledText({
    super.key,
    required this.styledString,
    this.styledColor,
    required this.styledFontSize,
    this.styledWeight,
    this.styledStyle,
    this.styledAlign,
    this.textLineNumber,
    this.letterSpace,
    this.styledDecoration,
  });

  @override
  Widget build(BuildContext context) => Text(
        styledString,
        overflow: TextOverflow.ellipsis,
        maxLines: textLineNumber ?? 100,
        textAlign: styledAlign ?? TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: styledColor ?? CustomTheme.darkColor,
          fontSize: styledFontSize,
          fontWeight: styledWeight ?? FontWeight.normal,
          fontStyle: styledStyle,
          letterSpacing: letterSpace ?? 0,
          decoration: styledDecoration ?? TextDecoration.none,
        ),
      );
}
