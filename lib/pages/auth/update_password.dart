import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/custom_snackbar.dart';
import 'package:teknopark_pdks/widgets/styled_secure_textfield.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  SizeConfig sizeConfig = SizeConfig();
  TextEditingController oldPasswordCT = TextEditingController();
  TextEditingController newPasswordCT = TextEditingController();
  TextEditingController new1PasswordCT = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    //   CustomSnackBar(context, response['message'], type: true);
    //   clearTextFields();
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
            styledString: "Şifremi Güncelle",
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
                            "assets/images/update_pass.png",
                            width: sizeConfig.widthSize(context, 110),
                          ),
                          Spaces.smallSpace(context),
                          const StyledText(
                            styledString: "Şifremi güncelle",
                            styledFontSize: 18,
                            styledWeight: FontWeight.w600,
                            styledColor: CustomTheme.darkColor,
                          ),
                          StyledSecureTextField(
                            textFieldMaxLength: 120,
                            textFieldHintText: "Eski Şifreniz",
                            textFieldInputType: TextInputType.text,
                            textFieldController: oldPasswordCT,
                            textFieldIcon: "assets/images/unlock.png",
                            showTitle: false,
                            onChanged: () {},
                            isJustRead: false,
                            isAutofocus: false,
                            onTap: (() {}),
                          ),
                          StyledSecureTextField(
                            textFieldMaxLength: 120,
                            textFieldHintText: "Yeni Şifreniz",
                            textFieldInputType: TextInputType.text,
                            textFieldController: newPasswordCT,
                            textFieldIcon: "assets/images/unlock.png",
                            showTitle: false,
                            onChanged: () {},
                            isJustRead: false,
                            isAutofocus: false,
                            onTap: (() {}),
                          ),
                          StyledSecureTextField(
                            textFieldMaxLength: 120,
                            textFieldHintText: "Yeni Şifreniz Tekrar",
                            textFieldInputType: TextInputType.text,
                            textFieldController: new1PasswordCT,
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
                  newPasswordCT.text.trim().isEmpty ||
                  new1PasswordCT.text.trim().isEmpty) {
                CustomSnackBar(context, "Tüm Alanlar Dolu Olmalıdır.",
                    type: false);
              } else if (newPasswordCT.text.trim() !=
                  new1PasswordCT.text.trim()) {
                CustomSnackBar(context, "Şifreler Uyuşmuyor", type: false);
              } else {
                changePassword();
              }
            },
            buttonText: "Şifremi Güncelle",
            buttonTextColor: CustomTheme.darkColor,
            buttonWidth: 320,
            buttonColor: CustomTheme.secondColor,
          ),
        ),
      ),
    );
  }
}
