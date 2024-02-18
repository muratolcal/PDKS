import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/loader.dart';

class BigImage {
  static showAlertDialog(BuildContext context, String image, double? maxScale,
      {bool? isDownloadable}) {
    downloadImageToGallery() async {
      Loader.show();
      var url = image;

      // var response = await http.get(Uri.parse(url));
      // if (response.statusCode == 200) {
      //   final result = await ImageGallerySaver.saveImage(
      //     Uint8List.fromList(response.bodyBytes),
      //     quality: 100,
      //     name: "ardemsoft_${DateTime.now().millisecondsSinceEpoch}",
      //   );
      //   CustomSnackBar(context, AppLocalizations.of(context)!.gorselKaydedildi,
      //       type: true);
      // } else {
      //   print('Failed to download image: ${response.statusCode}');
      // }
      Loader.dismiss();
    }

    AlertDialog customLoader = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(10),
      content: Stack(
        children: [
          InteractiveViewer(
              panEnabled: false,
              minScale: 1,
              maxScale: maxScale ?? 2,
              child: image != "" && image.contains("http") ||
                      image.contains("wwww")
                  ? CachedNetworkImage(
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      imageUrl: image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 1,
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Image.asset(
                            "assets/images/picture.png",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.topCenter,
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      image != "" ? image : "assets/images/picture.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 1,
                      alignment: Alignment.topCenter,
                    )),
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: Colors.black,
              ),
              child: const Icon(
                Icons.close,
                color: CustomTheme.white,
                // size: 50,
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
            ),
          ),
          Visibility(
            visible: isDownloadable ?? false,
            child: Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.green,
                ),
                child: const Icon(
                  Icons.download,
                  color: CustomTheme.white,
                  // size: 50,
                ),
                onPressed: () {
                  downloadImageToGallery();
                },
              ),
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
    );

    showDialog(
      useSafeArea: true,
      barrierColor: Colors.black54,
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: customLoader,
        );
      },
    );
  }
}
