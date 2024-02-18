import 'dart:async';
import 'dart:io';

import 'package:teknopark_pdks/pages/Auth/login.dart';
import 'package:teknopark_pdks/pages/home/home.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/helper.dart';
import 'package:teknopark_pdks/utils/launch_url.dart';
import 'package:teknopark_pdks/widgets/styled_popup.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

String? version = "1.0.0";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SizeConfig sizeConfig = SizeConfig();

  // checkVersion() {
  //   PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
  //     appversion = packageInfo.version;

  //     print("Uygulama versiyonu : $appversion");

  //     return appversion;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
    });
    checkVersion();
  }

  checkVersion() async {
    return checkLoged();
    var response; // = await CommonService.appStatus();

    if (response != null && response['status'] == true) {
      Helper.appStatus = response['data'];
      if (Platform.isAndroid) {
        if (int.parse(response['data']['android_version'].replaceAll(".", "")) >
            int.parse(version!.replaceAll(".", ""))) {
          StyledPopup(
            context: context,
            title: "Uygulamayı Güncelle!",
            description:
                "Uygulama versiyonunuzu güncellemeniz gerekiyor. Güncelleme yapmak için 'Güncelle' butonuna tıklayınız. Güncelledikten sonra uygulamayı yeniden başlatınız.",
            type: 1,
            btn1: "Güncelle",
            btn2: "Güncelledim",
            isTwoButton: true,
            onTap1: () {
              UrlLaunch.openUrl(context, response['data']['android_link']);
            },
            onTap2: () {
              Navigator.pop(context);
              init();
            },
            image: 'google-play.png',
          ).show();
        } else {
          checkLoged();
        }
      } else if (Platform.isIOS) {
        if (int.parse(response['data']['ios_version'].replaceAll(".", "")) >
            int.parse(version!.replaceAll(".", ""))) {
          StyledPopup(
            context: context,
            title: "Uygulamayı Güncelle!",
            description:
                "Uygulama versiyonunuzu güncellemeniz gerekiyor. Güncelleme yapmak için 'Güncelle' butonuna tıklayınız. Güncelledikten sonra uygulamayı yeniden başlatınız.",
            type: 1,
            btn1: "Güncelle",
            btn2: "Güncelledim",
            isTwoButton: true,
            onTap1: () {
              UrlLaunch.openUrl(context, response['data']['ios_link']);
            },
            onTap2: () {
              Navigator.pop(context);
              init();
            },
            image: 'logo.png',
          ).show();
        } else {
          checkLoged();
        }
      } else {
        checkLoged();
      }
    } else if (response != null && response['status'] == false) {
      StyledPopup(
        context: context,
        title: "Yanıt Yok",
        description: response['messages'] ?? 'Daha sonra tekrar deneyiniz',
        type: 1,
        btn1: "Kapat",
        btn2: "",
        isTwoButton: false,
        onTap1: () {},
        onTap2: () {},
        image: 'wifi.png',
      ).show();
    } else {
      StyledPopup(
        context: context,
        title: "Yanıt Yok",
        description: 'Daha sonra tekrar deneyiniz',
        type: 1,
        btn1: "Kapat",
        btn2: "",
        isTwoButton: false,
        onTap1: () {},
        onTap2: () {},
        image: 'wifi.png',
      ).show();
    }
  }

  int? initScreen = 0;
  checkLoged() async {
    var usertoken = await Helper.getShared('token');
    var screencontroller = await Helper.getShared('screen');

    if (usertoken != null) {
      // BaseService.token = usertoken;
      // var jresponse = await AuthService.userProfile();
      // //var showOnoarding = await await Helper.getShared('showOnboarding');
      // //Kişiye onboarding gösterilip gösterilmeyeceğine dair yazılacak kod bu şekilde başlayacaktır.

      // if (jresponse != null && jresponse['status']) {
      //   Helper.user = jresponse['data'];
      //   Timer((const Duration(milliseconds: 2000)), () {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => BottomNavbar(
      //                 remoteIndex: -1,
      //               )),
      //     );
      //   });
      // } else {
      //   if (screencontroller == "1") {
      //     Timer((const Duration(milliseconds: 2000)), () {
      //       // Navigator.pushReplacement(
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => const LoginPage()),
      //       // );
      //     });
      //   } else {
      //     // Timer((const Duration(milliseconds: 2000)), () {
      //     //   Navigator.pushReplacement(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) => OnboardingPage(),
      //     //     ),
      //     //   );
      //     // });
      //   }
      // }
    } else {
      if (screencontroller == "1") {
        Timer((const Duration(milliseconds: 3000)), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        });
      } else {
        Timer((const Duration(milliseconds: 3000)), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: sizeConfig.heightSize(context, 250),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
              text: 'OVEX YAZILIM VE BİŞİLİM TEKNOLOJİLERİ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: CustomTheme.darkColor,
              ),
            ),
            TextSpan(
              text: ' TARAFINDAN GELİŞTİRİLMİŞTİR',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                color: CustomTheme.darkColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
