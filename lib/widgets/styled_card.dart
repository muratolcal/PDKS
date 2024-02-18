import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/image_widget.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class StyledCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double cardWidth;
  final double cardHeight;
  final double fontSize;
  final double subFontSize;
  final Color color;
  const StyledCard(
      {super.key,
      this.title,
      required this.cardWidth,
      required this.cardHeight,
      required this.fontSize,
      required this.color,
      this.subtitle,
      required this.subFontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig().heightSize(context, cardHeight),
      width: SizeConfig().widthSize(context, cardWidth),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: StyledText(
                    styledString: title ?? '',
                    styledFontSize: fontSize,
                    styledWeight: FontWeight.bold,
                    styledAlign: TextAlign.left,
                    styledColor: CustomTheme.primaryColor,
                  ),
                ),
              ),
              Spaces.miniSpace(context),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: StyledText(
                  styledString: subtitle ?? '',
                  styledFontSize: subFontSize,
                  styledWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
