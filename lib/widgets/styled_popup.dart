import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class StyledPopup {
  final BuildContext context;
  final String title;
  final String description;
  final int type; // success, error, warning, info
  final String image;
  final bool? dismis;
  final String btn1;
  final String btn2;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final bool isTwoButton;

  StyledPopup({
    required this.image,
    required this.context,
    required this.title,
    required this.description,
    required this.type,
    this.dismis,
    required this.btn1,
    required this.btn2,
    this.onTap1,
    this.onTap2,
    required this.isTwoButton,
  });

  void show() {
    SizeConfig sizeConfig = SizeConfig();
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: dismis ?? false,
      builder: (BuildContext context) {
        RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomTheme.mainRadius),
        );

        return WillPopScope(
          onWillPop: () async => dismis ?? false,
          child: AlertDialog(
            shape: roundedShape,
            scrollable: true,
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowAlignment: OverflowBarAlignment.center,
            // iconPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,

            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: sizeConfig.heightSize(context, 10),
                  ),
                  Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.contain,
                    width: sizeConfig.widthSize(context, 117),
                  ),
                  SizedBox(
                    height: sizeConfig.heightSize(context, 10),
                  ),
                  StyledText(
                    styledString: title,
                    styledFontSize: 18,
                    styledColor: CustomTheme.darkColor,
                    styledWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: sizeConfig.heightSize(context, 10),
                  ),
                  StyledText(
                    styledString: description,
                    styledFontSize: 14,
                    styledColor: CustomTheme.darkColor,
                    styledWeight: FontWeight.normal,
                  ),
                  if (isTwoButton)
                    SizedBox(
                      height: sizeConfig.heightSize(context, 10),
                    ),
                  if (isTwoButton)
                    StyledButton(
                      buttonActivation: onTap2 ??
                          () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                      buttonText: btn2,
                      buttonTextColor: CustomTheme.darkColor,
                      buttonColor: CustomTheme.primaryColor,
                      buttonWidth: 230,
                    ),
                  SizedBox(
                    height: sizeConfig.heightSize(context, 10),
                  ),
                  SizedBox(
                    width: sizeConfig.widthSize(context, 230),
                    height: sizeConfig.heightSize(context, 40),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black), // Set the border color
                        borderRadius:
                            BorderRadius.circular(10), // Set the border radius
                      ),
                      onPressed: onTap1 ??
                          () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                      child: StyledText(
                        styledString: btn1,
                        styledFontSize: 14,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getPopupColor(int type) {
    switch (type) {
      case 1:
        return CustomTheme.successColor;
      case 2:
        return CustomTheme.errorColor;
      case 3:
        return CustomTheme.warningColor;
      case 4:
        return CustomTheme.infoColor;
      default:
        return CustomTheme.successColor;
    }
  }

  IconData _getPopupIcon(int type) {
    switch (type) {
      case 1:
        return Icons.check_circle;
      case 2:
        return Icons.error_rounded;
      case 3:
        return Icons.warning;
      case 4:
        return Icons.info_rounded;
      default:
        return Icons.info_rounded;
    }
  }
}
