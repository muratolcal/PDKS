import 'dart:ffi';

import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:flutter/widgets.dart';

class ImageArea extends StatefulWidget {
  final double heightSize;
  final double widthSize;
  final String imageName;
  final BoxFit? boxFit;

  const ImageArea(
      {super.key,
      required this.heightSize,
      required this.widthSize,
      required this.imageName,
      this.boxFit});

  @override
  State<ImageArea> createState() => _ImageAreaState();
}

class _ImageAreaState extends State<ImageArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig().heightSize(context, widget.heightSize),
      width: SizeConfig().widthSize(context, widget.widthSize),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${widget.imageName}"),
          fit: widget.boxFit ?? BoxFit.contain,
        ),
        color: CustomTheme.white,
      ),
    );
  }
}
