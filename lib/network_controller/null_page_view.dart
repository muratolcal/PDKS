import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:flutter/material.dart';

Widget nullPageView(
    BuildContext context, String imagePath, String title, String subtitle) {
  SizeConfig sizeConfig = SizeConfig();
  return Scaffold(
    // drawer: NavigationDrawer(),
    backgroundColor: CustomTheme.primaryColor,

    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: CustomTheme.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(sizeConfig.heightSize(context, 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              imagePath,
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: CustomTheme.primaryColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                subtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
