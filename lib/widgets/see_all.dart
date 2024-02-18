import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

GestureDetector seeMore(
  BuildContext context,
  VoidCallback onPressed,
  SizeConfig sizeConfig,
  double height,
  double width,
) {
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomTheme.mainRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CustomTheme.mainRadius),
        child: Container(
          width: sizeConfig.widthSize(
            context,
            width,
          ),
          height: sizeConfig.heightSize(
            context,
            height,
          ),
          color: CustomTheme.primaryColor.withOpacity(1),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              children: [
                Image.asset(
                  "assets/images/megaphone.png",
                  width: sizeConfig.widthSize(
                    context,
                    60,
                  ),
                ),
                Spaces.miniSpace(context),
                StyledText(
                  styledString: "Tümünü Gör",
                  styledFontSize: 16,
                  styledWeight: FontWeight.bold,
                  styledColor: CustomTheme.darkColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
