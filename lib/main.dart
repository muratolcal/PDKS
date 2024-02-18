import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknopark_pdks/bloc/auth/Login/login_cubit.dart';
import 'package:teknopark_pdks/bloc/home/home_cubit.dart';
import 'package:teknopark_pdks/network_controller/network_connectivity_build.dart';
import 'package:teknopark_pdks/pages/auth/login.dart';
import 'package:teknopark_pdks/pages/splash_page.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teknopark_pdks/network_controller/network_connectivity_build.dart';
import 'package:teknopark_pdks/pages/home/home.dart';
import 'package:teknopark_pdks/pages/splash_page.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

// void configurePurchase() async {
//   final String apiKey = Subscriber.getApiKey();

//   try {
//     await Purchases.setup(apiKey);
//   } catch (e) {
//     print("Error configuring Purchases: $e");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(null, null, null, null),
      child: MaterialApp(
        title: 'Tedarikçi Bul',
        theme: ThemeData(
          primarySwatch: CustomTheme.materialColor,
          fontFamily: 'Montserrat',
          primaryColor: CustomTheme.primaryColor,
          canvasColor: CustomTheme.primaryColor,
          scaffoldBackgroundColor: const Color(0xFFFCFCFC),
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              color: CustomTheme.white,
              fontSize: 46,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        home: const LoginScreen(),
        builder: EasyLoading.init(
          builder: NetworkConnectivityBuild.build,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('tr', ''),
          Locale('tr', ''),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  MaterialPageRoute buildRoute(Widget child, {RouteSettings? settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      );
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
