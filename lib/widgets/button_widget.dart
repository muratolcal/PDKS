import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatefulWidget {
  final VoidCallback buttonActivation;

  final String buttonText;
  final Color buttonTextColor;
  final Color? buttonColor;
  final double? buttonWidth;
  final IconData? buttonIcon;

  const StyledButton({
    super.key,
    required this.buttonActivation,
    required this.buttonText,
    required this.buttonTextColor,
    this.buttonColor,
    this.buttonWidth,
    this.buttonIcon,
  });

  @override
  State<StyledButton> createState() => _StyledButtonState();
}

class _StyledButtonState extends State<StyledButton> {
  SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomTheme.mainRadius),
        ),
        height: sizeConfig.widthSize(context, 45),
        child: SizedBox(
          width: sizeConfig.widthSize(context, widget.buttonWidth ?? 240),
          height: sizeConfig.widthSize(context, 45),
          child: MaterialButton(
            elevation: 4,
            height: sizeConfig.heightSize(context, 40),
            onPressed: widget.buttonActivation,
            color: widget.buttonColor ?? CustomTheme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                CustomTheme.mainRadius,
              ),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyledText(
                    styledString: widget.buttonText,
                    styledColor: widget.buttonTextColor,
                    styledWeight: FontWeight.bold,
                    styledFontSize: 16,
                    textLineNumber: 1,
                  ),
                  Spaces.miniWSpace(context),
                  widget.buttonIcon != null
                      ? FaIcon(
                          widget.buttonIcon!,
                          color: widget.buttonTextColor,
                          size: 16,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      );
}
