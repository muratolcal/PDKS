import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {
  static openUrl(
    BuildContext context,
    String link,
  ) async {
    return showDialog<void>(
      useSafeArea: true,
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          elevation: 2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // TextWidget(
                //   textAllString: 'Can Dostlarım sitemize yönlendiriliyorsunuz.',
                //   textAllFontSize: 18,
                //   textLineNumber: 4,
                //   textAllAlign: TextAlign.center,
                //   textAllWeight: FontWeight.bold,
                // ),
                const SizedBox(
                  height: 5,
                ),

                StyledText(
                  styledString: '$link adresine Git',
                  styledFontSize: 12,
                  styledWeight: FontWeight.bold,
                  textLineNumber: 4,
                  styledAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black.withOpacity(0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      textColor: CustomTheme.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      color: CustomTheme.primaryColor,
                      child: const StyledText(
                        styledString: 'Vazgeç',
                        styledFontSize: 16,
                        styledWeight: FontWeight.bold,
                        textLineNumber: 1,
                        styledAlign: TextAlign.center,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        _launchURL(link);
                      },
                      textColor: CustomTheme.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      color: CustomTheme.primaryColor,
                      child: const StyledText(
                        styledString: 'Git',
                        styledFontSize: 16,
                        styledWeight: FontWeight.bold,
                        textLineNumber: 1,
                        styledAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static _launchURL(String url) async {
    String urls;
    if (!url.contains('http') && !url.contains("tel")) {
      urls = "https://$url";
    } else {
      urls = url;
    }

    if (!await launch(
      urls,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'': ''},
    )) {
      throw 'Could not launch $url';
    }
  }
}
