import 'package:teknopark_pdks/services/base_service.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/utils/big_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BigImage.showAlertDialog(context, imageUrl, 3);
      },
      child: CachedNetworkImage(
        placeholder: (context, url) => Center(
          child: Center(
            child: Lottie.asset(
              'assets/lottieFiles/image_loader.json',
              width: sizeConfig.widthSize(context, 120),
            ),
          ),
        ),
        imageUrl: imageUrl,
        width: sizeConfig.widthSize(context, width ?? 360),
        height: sizeConfig.heightSize(context, height ?? 200),
        fit: BoxFit.cover,
        alignment:
            BaseService.token == "" ? Alignment.topCenter : Alignment.center,
        errorWidget: (context, url, error) {
          return Center(
            child: Image.asset(
              "assets/images/picture.png",
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: sizeConfig.widthSize(
                context,
                width ?? 360,
              ),
            ),
          );
        },
      ),
    );
  }
}
