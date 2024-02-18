import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar(
    BuildContext context,
    String content, {
    SnackBarAction? snackBarAction,
    Color backgroundColor = Colors.grey,
    required bool type, // true = success, false = error
    int duration = 3,
  }) {
    final SnackBar snackBar = SnackBar(
      action: snackBarAction,
      duration: Duration(
        seconds: duration,
      ),
      backgroundColor: type == true ? Colors.green : Colors.red,
      content: Text(content),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CustomBottom {
  static showCustomBottomSheet(
    BuildContext context,
    String content,
    bool type,
  ) {
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
      context: context,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        // Future.delayed(const Duration(seconds: 3), () {
        //   Navigator.pop(context);
        // });
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(CustomTheme.mainRadius),
              topRight: Radius.circular(CustomTheme.mainRadius),
            ),
            color: type == true ? Colors.green : Colors.red,
          ),
          child: Container(
            // height: 120,
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StyledText(
                    styledString: content,
                    styledFontSize: 14,
                    styledColor: CustomTheme.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
