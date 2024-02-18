import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknopark_pdks/bloc/auth/Login/login_cubit.dart';
import 'package:teknopark_pdks/bloc/home/home_cubit.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/model/auth/Login/user_data.dart';
import 'package:teknopark_pdks/services/base_service.dart';
import 'package:teknopark_pdks/services/home/anno_service.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/helper.dart';
import 'package:teknopark_pdks/widgets/barcode_scanner.dart';
import 'package:teknopark_pdks/widgets/custom_snackbar.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController testCT = TextEditingController();

  SizeConfig sizeConfig = SizeConfig();

  List splitted = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        service: AnnoService(
          Dio(
            BaseOptions(baseUrl: BaseService.baseUrl),
          ),
        ),
      )..getAnnoData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccesful) {}
        },
        builder: (context, state) {
          return _homeScaffold(context);
        },
      ),
    ); // appBar: const CustomAppBar(title: 'Custom App Bar', isBackButton: true),
  }

  Scaffold _homeScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.white,
      body: SingleChildScrollView(child: _homeBody(context)),
    );
  }

  Center _homeBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StyledText(
                        styledString: 'Hoşgeldin,',
                        styledFontSize: 20,
                        styledWeight: FontWeight.bold,
                        styledColor: CustomTheme.white,
                        styledAlign: TextAlign.center,
                      ),
                      StyledText(
                        styledString: '-',
                        styledFontSize: 18,
                        styledWeight: FontWeight.w600,
                        styledColor: CustomTheme.white,
                        styledAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Spaces.bigWSpace(context),
                CircleAvatar(
                  backgroundColor: CustomTheme.white,
                  radius: 60,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spaces.miniSpace(context),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: StyledText(
                styledString: 'Duyurular',
                styledFontSize: 20,
                styledWeight: FontWeight.bold,
                styledColor: CustomTheme.primaryColor,
                styledAlign: TextAlign.center,
              ),
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Visibility(
                  visible: state.isLoading,
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeSuccesful) {
                return Container(
                  width: sizeConfig.widthSize(context, 375),
                  height: sizeConfig.heightSize(context, 180),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.annoModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final anno = state.annoModel.data![index];
                      return Card(
                        child: ListTile(
                          title: StyledText(
                              styledString: anno.title ?? 'Başlık',
                              styledFontSize: 14,
                              styledAlign: TextAlign.left,
                              styledWeight: FontWeight.bold,
                              styledColor: CustomTheme.primaryColor),
                          subtitle: StyledText(
                              styledString: anno.summary ?? '',
                              styledFontSize: 12),
                        ),
                      );
                    },
                  ),
                );
              }
              return SizedBox();
            },
          ),
          Spaces.smallSpace(context),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shadowColor: CustomTheme.darkColor,
                color: CustomTheme.secondColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: sizeConfig.heightSize(context, 100),
                  width: sizeConfig.widthSize(context, 120),
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10),
                  child: StyledText(
                    styledString: 'Harita',
                    styledFontSize: 15,
                    styledColor: CustomTheme.white,
                    styledWeight: FontWeight.bold,
                    styledAlign: TextAlign.right,
                  ),
                ),
              ),
              Spaces.smallWSpace(context),
              Card(
                elevation: 4,
                shadowColor: CustomTheme.darkColor,
                color: CustomTheme.materialColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: sizeConfig.heightSize(context, 100),
                  width: sizeConfig.widthSize(context, 120),
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10),
                  child: StyledText(
                    styledString: 'Hareketlerim',
                    styledFontSize: 15,
                    styledColor: CustomTheme.white,
                    styledWeight: FontWeight.bold,
                    styledAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          Spaces.miniSpace(context),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Card(
                  elevation: 4,
                  shadowColor: CustomTheme.darkColor,
                  color: CustomTheme.successColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: sizeConfig.heightSize(context, 100),
                    width: sizeConfig.widthSize(context, 120),
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(10),
                    child: StyledText(
                      styledString: 'Giriş Yap',
                      styledFontSize: 15,
                      styledColor: CustomTheme.white,
                      styledWeight: FontWeight.bold,
                      styledAlign: TextAlign.right,
                    ),
                  ),
                ),
                onTap: () async {
                  String barcode = await barcodeScanner.scanQR();
                  if (barcode != "") {
                    splitted = barcode.split(' ');
                    print(splitted);
                    print(splitted.length);
                  } else {
                    CustomSnackBar(context, 'QR Okunamadı', type: false);
                  }
                },
              ),
              Spaces.smallWSpace(context),
              GestureDetector(
                child: Card(
                  elevation: 4,
                  shadowColor: CustomTheme.darkColor,
                  color: CustomTheme.errorColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: sizeConfig.heightSize(context, 100),
                    width: sizeConfig.widthSize(context, 120),
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(10),
                    child: StyledText(
                      styledString: 'Çıkış Yap',
                      styledFontSize: 15,
                      styledColor: CustomTheme.white,
                      styledWeight: FontWeight.bold,
                      styledAlign: TextAlign.right,
                    ),
                  ),
                ),
                onTap: () async {
                  String barcode = await barcodeScanner.scanQR();
                  if (barcode != "") {
                    splitted = barcode.split(' ');
                    print(splitted);
                    print(splitted.length);
                  } else {
                    CustomSnackBar(context, 'QR Okunamadı', type: false);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
