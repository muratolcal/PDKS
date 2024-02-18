import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButton;
  final bool? isActionButton;
  final VoidCallback? buttonPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.isBackButton,
    this.isActionButton,
    this.buttonPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomTheme
              .primaryColor, // Customize the background color of the app bar
          borderRadius: BorderRadius.only(
            bottomLeft:
                Radius.circular(20.0), // Radius for the bottom left corner
            bottomRight:
                Radius.circular(20.0), // Radius for the bottom right corner
          )),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: StyledText(
          styledString: title,
          styledFontSize: 20,
          styledWeight: FontWeight.bold,
          styledColor: Colors.white,
        ),
        centerTitle: true,
        leading: isBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: CustomTheme.darkColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        actions: [
          isActionButton == true
              ? IconButton(
                  icon: FaIcon(FontAwesomeIcons.gear),
                  color: CustomTheme.white,
                  iconSize: SizeConfig().widthSize(context, 25),
                  onPressed: buttonPressed,
                )
              : Container(),
        ],
      ),
    );
  }
}
