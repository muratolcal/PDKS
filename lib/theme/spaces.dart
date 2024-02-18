import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:flutter/material.dart';

class Spaces {
  static SizedBox miniSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(height: sizeConfig.heightSize(context, 8));
  }

  static SizedBox smallSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(height: sizeConfig.heightSize(context, 24));
  }

  static SizedBox midSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(height: sizeConfig.heightSize(context, 48));
  }

  static SizedBox bigSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(height: sizeConfig.heightSize(context, 96));
  }

  static SizedBox miniWSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(width: sizeConfig.widthSize(context, 8));
  }

  static SizedBox smallWSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(width: sizeConfig.widthSize(context, 24));
  }

  static SizedBox midWSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(width: sizeConfig.widthSize(context, 48));
  }

  static SizedBox bigWSpace(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    return SizedBox(width: sizeConfig.widthSize(context, 96));
  }
}
