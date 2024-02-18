import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/services/base_service.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/helper.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/custom_snackbar.dart';
import 'package:teknopark_pdks/widgets/styled_popup.dart';
import 'package:teknopark_pdks/widgets/styled_secure_textfield.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  SizeConfig sizeConfig = SizeConfig();
  TextEditingController oldPasswordCT = TextEditingController();
  TextEditingController newPasswordCT = TextEditingController();
  TextEditingController new1PasswordCT = TextEditingController();
  TextEditingController tcNoCT = TextEditingController();

  @override
  void initState() {
    super.initState();

    new1PasswordCT.text = "123456.123456*";
    newPasswordCT.text = "123456.123456*";
  }

  @override
  void dispose() {
    oldPasswordCT.dispose();
    newPasswordCT.dispose();
    new1PasswordCT.dispose();
    super.dispose();
  }

  changePassword() async {
    // var response = await AuthService.changePassword(
    //   oldPasswordCT.text.trim(),
    //   newPasswordCT.text.trim(),
    //   new1PasswordCT.text.trim(),
    // );
    // if (response != null && response['status'] == true) {
    //   //
    //   var response = await AuthService.userLogout();
    //   if (response != null && response['status'] == true) {
    //     BaseService.token = "";
    //     Helper.setShared("token", "");
    //     Helper.user = [];
    //     Helper.studentId = 0;
    //     Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => const NonUserHomeNewScreen()),
    //       (Route<dynamic> route) => false,
    //     );
    //   } else {
    //     BaseService.token = "";
    //     Helper.setShared("token", "");
    //     Helper.user = [];
    //     Helper.studentId = 0;
    //     Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => const NonUserHomeNewScreen()),
    //       (Route<dynamic> route) => false,
    //     );
    //   }
    // } else if (response != null && response['status'] == false) {
    //   CustomSnackBar(context, response['message'], type: false);
    // } else {
    //   CustomSnackBar(
    //       context, AppLocalizations.of(context)!.sifreDegistirilemedi,
    //       type: false);
    // }
  }

  clearTextFields() {
    oldPasswordCT.clear();
    newPasswordCT.clear();
    new1PasswordCT.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: CustomTheme.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomTheme.darkColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const StyledText(
            styledString: "Hesabımı Sil",
            styledFontSize: 18,
            styledWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: sizeConfig.widthSize(context, 320),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Spaces.smallSpace(context),
                          Image.asset(
                            "assets/images/delete_account.png",
                            width: sizeConfig.widthSize(context, 110),
                          ),
                          Spaces.smallSpace(context),
                          const StyledText(
                            styledString: "Hesabı Sil",
                            styledFontSize: 18,
                            styledWeight: FontWeight.w600,
                            styledColor: CustomTheme.darkColor,
                          ),
                          // StyledTextField(
                          //   textFieldMaxLength: 11,
                          //   textFieldHintText: "Tc Kimlik No",
                          //   textFieldInputType: TextInputType.number,
                          //   textFieldController: tcNoCT,
                          //   textFieldIcon: FontAwesomeIcons.react,
                          //   textFieldFormatterType: "number",
                          //   showTitle: false,
                          //   onChanged: () {},
                          //   isJustRead: false,
                          //   isAutofocus: false,
                          //   onTap: (() {}),
                          // ),
                          StyledSecureTextField(
                            textFieldMaxLength: 120,
                            textFieldHintText: "Şifreniz",
                            textFieldInputType: TextInputType.text,
                            textFieldController: oldPasswordCT,
                            textFieldIcon: "assets/images/unlock.png",
                            showTitle: false,
                            onChanged: () {},
                            isJustRead: false,
                            isAutofocus: false,
                            onTap: (() {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: sizeConfig.heightSize(context, 30),
            right: sizeConfig.heightSize(context, 30),
            bottom: sizeConfig.heightSize(context, 30),
          ),
          child: StyledButton(
            buttonActivation: () {
              if (oldPasswordCT.text.trim().isEmpty ||
                  tcNoCT.text.trim().isEmpty) {
                CustomSnackBar(context, "Tüm Alanlar Dolu Olmalıdır.",
                    type: false);
              } else if (newPasswordCT.text.trim() !=
                  new1PasswordCT.text.trim()) {
                CustomSnackBar(context, "Şifreler Uyuşmuyor", type: false);
              } else {
                StyledPopup(
                  context: context,
                  title: "Hesabı Sil",
                  description: "",
                  btn1: "Vazgeç",
                  btn2: "Hesabı Sil",
                  isTwoButton: true,
                  dismis: true,
                  onTap1: () {
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                  onTap2: () {
                    if (tcNoCT.text.trim() == Helper.user['tc']) {
                      changePassword();
                    } else {
                      CustomSnackBar(context, "Tc Kimlik Numarası",
                          type: false);
                    }
                  },
                  image: 'delete-user.png',
                  type: 1,
                ).show();
              }
            },
            buttonText: "Hesabı Sil",
            buttonTextColor: CustomTheme.darkColor,
            buttonWidth: 320,
            buttonColor: CustomTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}
