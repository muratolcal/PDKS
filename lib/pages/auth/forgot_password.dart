import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/styled_popup.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  SizeConfig sizeConfig = SizeConfig();
  TextEditingController tcNoCT = TextEditingController();
  TextEditingController phoneCT = TextEditingController();

  sendPassReset() async {
    // var response = await AuthService.recoverPassword(
    //     tcNoCT.text.trim(), phoneCT.text.trim());
    // if (response != null && response['status'] == true) {
    //   StyledPopup(
    //     image: "scs.png",
    //     context: context,
    //     title: "Başarılı",
    //     description: response['message'],
    //     btn1: "Giriş Yap",
    //     btn2: "btn2",
    //     isTwoButton: false,
    //     onTap1: () {
    //       Navigator.pop(context);
    //       Navigator.pop(context);
    //     },
    //     type: 1,
    //   ).show();
    // } else if (response != null && response['status'] == false) {
    //   StyledPopup(
    //     image: "error.png",
    //     context: context,
    //     title: AppLocalizations.of(context)!.basarisiz,
    //     description: response['message'],
    //     btn1: AppLocalizations.of(context)!.tamam,
    //     btn2: "btn2",
    //     isTwoButton: false,
    //     onTap1: () {
    //       Navigator.pop(context);
    //     },
    //   ).show();
    // } else {
    //   StyledPopup(
    //     image: "error.png",
    //     context: context,
    //     title: AppLocalizations.of(context)!.basarisiz,
    //     description: AppLocalizations.of(context)!.birHataOlustu,
    //     btn1: AppLocalizations.of(context)!.tamam,
    //     btn2: "btn2",
    //     isTwoButton: false,
    //     onTap1: () {
    //       Navigator.pop(context);
    //     },
    //   ).show();
    // }
  }

  @override
  void dispose() {
    tcNoCT.dispose();
    phoneCT.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
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
                          "assets/images/logo.png",
                          height: sizeConfig.heightSize(context, 80),
                        ),
                        Spaces.miniSpace(context),
                        StyledTextField(
                          text: 'T.C Kimlik No',
                          validate: (validate) {},
                          textFieldMaxLength: 11,
                          textFieldHintText: 'T.C Kimlik No',
                          textFieldInputType: TextInputType.number,
                        ),
                        StyledTextField(
                          text: 'Telefon Numarası',
                          validate: (validate) {},
                          textFieldMaxLength: 11,
                          textFieldHintText: 'Telefon Numarası',
                          textFieldInputType: TextInputType.number,
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
            sendPassReset();
          },
          buttonText: "Sms Gönder",
          buttonTextColor: CustomTheme.white,
          buttonColor: CustomTheme.secondColor,
          buttonWidth: 320,
        ),
      ),
    );
  }
}
