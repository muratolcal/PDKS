import 'dart:ffi';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/cached_image.dart';
import 'package:teknopark_pdks/utils/helper.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/styled_appbar.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SizeConfig sizeConfig = SizeConfig();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.white,
      body: Column(
        children: [
          Container(
            width: sizeConfig.widthSize(context, 375),
            height: sizeConfig.heightSize(context, 250),
            decoration: BoxDecoration(
              color: CustomTheme
                  .primaryColor, // Customize the background color of the app bar
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(20.0), // Radius for the bottom left corner
                bottomRight:
                    Radius.circular(20.0), // Radius for the bottom right corner
              ),
            ),
            child: Column(
              children: [
                Spaces.midSpace(context),
                StyledText(
                  styledString: "Ayarlar",
                  styledFontSize: 20,
                  styledColor: CustomTheme.white,
                  styledWeight: FontWeight.bold,
                ),
                Spaces.smallSpace(context),
                CircleAvatar(
                  backgroundColor: CustomTheme.white,
                  radius: 45,
                  child: ClipOval(
                      // child: Image.asset(
                      //   'assets/images/man.png',
                      //   fit: BoxFit.contain,
                      // ),
                      // child: CustomCachedNetworkImage(
                      //   imageUrl: Helper.user['profile_image']
                      //           .replaceAll('.svg', '.png') ??
                      //       "",
                      //   width: sizeConfig.widthSize(
                      //     context,
                      //     300,
                      //   ),
                      //   height: sizeConfig.heightSize(
                      //     context,
                      //     300,
                      //   ),
                      // ),
                      ),
                ),
              ],
            ),
          ),
          Spaces.smallSpace(context),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: StyledText(
              styledString: "Hakkımda",
              styledFontSize: 15,
              styledColor: CustomTheme.darkColor,
              styledWeight: FontWeight.bold,
              styledAlign: TextAlign.left,
            ),
          ),
          Container(
            width: sizeConfig.widthSize(context, 330),
            height: sizeConfig.heightSize(context, 150),
            padding: EdgeInsets.only(top: 15, left: 15),
            decoration: ShapeDecoration(
              color: Color(0x0C24265F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.person),
                      Spaces.smallWSpace(context),
                      StyledText(
                        styledString: "Profilim",
                        styledFontSize: 15,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                        styledAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                Spaces.smallSpace(context),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.sackDollar),
                      Spaces.smallWSpace(context),
                      StyledText(
                        styledString: "Güvenlik",
                        styledFontSize: 15,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                        styledAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                Spaces.smallSpace(context),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.ring),
                      Spaces.smallWSpace(context),
                      StyledText(
                        styledString: "Bildirimler",
                        styledFontSize: 15,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                        styledAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Spaces.smallSpace(context),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: StyledText(
              styledString: "Yardım",
              styledFontSize: 15,
              styledColor: CustomTheme.darkColor,
              styledWeight: FontWeight.bold,
              styledAlign: TextAlign.left,
            ),
          ),
          Container(
            width: sizeConfig.widthSize(context, 330),
            height: sizeConfig.heightSize(context, 175),
            padding: EdgeInsets.only(top: 15, left: 15),
            decoration: ShapeDecoration(
              color: Color(0x0C24265F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.person),
                      Spaces.smallWSpace(context),
                      StyledText(
                        styledString: "Yardım ve Destek",
                        styledFontSize: 15,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                        styledAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                Spaces.smallSpace(context),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.sackDollar),
                      Spaces.smallWSpace(context),
                      StyledText(
                        styledString: "Şart ve Koşullar",
                        styledFontSize: 15,
                        styledColor: CustomTheme.darkColor,
                        styledWeight: FontWeight.bold,
                        styledAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                Spaces.smallSpace(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
