import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/utils/cached_image.dart';
import 'package:teknopark_pdks/utils/helper.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  SizeConfig sizeConfig = SizeConfig();
  TextEditingController tcNoCT = TextEditingController();
  TextEditingController nameCT = TextEditingController();
  TextEditingController emailCT = TextEditingController();
  TextEditingController phoneCT = TextEditingController();
  TextEditingController ogrNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    // tcNoCT.text = Helper.user['tc'] ?? "-";
    // nameCT.text = Helper.user['name'] + " " + Helper.user['surname'] ?? "-";
    // emailCT.text = Helper.user['email'] ?? "-";
    // phoneCT.text = Helper.user['phone'] ?? "-";
    // ogrNo.text = Helper.user['student_no'] ?? "-";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profilim"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Spaces.miniSpace(context),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomTheme.secondColor,
                      border: Border.all(
                        color: CustomTheme.secondColor,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 45,
                    child: ClipOval(
                        // child: Image.asset(
                        //   'assets/images/man.png',
                        //   fit: BoxFit.contain,
                        // ),
                        // child: CustomCachedNetworkImage(
                        //   imageUrl: Helper.user['profile_image']
                        //           .replaceAll('.svg', '.png') ??
                        //       "",
                        //   width: sizeConfig.widthSize(
                        //     context,
                        //     300,
                        //   ),
                        //   height: sizeConfig.heightSize(
                        //     context,
                        //     300,
                        //   ),
                        // ),
                        ),
                  ),
                ),
                Spaces.miniSpace(context),
                // StyledText(
                //   styledString:
                //       Helper.user['name'] + " " + Helper.user['surname'] ?? "",
                //   styledFontSize: 16,
                //   styledWeight: FontWeight.w600,
                // ),
                Spaces.smallSpace(context),
                // StyledTextField(
                //   textFieldMaxLength: 11,
                //   textFieldHintText: "Tc Kimlik No",
                //   textFieldInputType: TextInputType.number,
                //   textFieldController: tcNoCT,
                //   textFieldIcon: FontAwesomeIcons.hashtag,
                //   textFieldFormatterType: "",
                //   showTitle: true,
                //   onChanged: () {},
                //   isJustRead: true,
                //   isAutofocus: false,
                //   onTap: () {},
                // ),
                // StyledTextField(
                //   textFieldMaxLength: 11,
                //   textFieldHintText: "Ad Soyad",
                //   textFieldInputType: TextInputType.number,
                //   textFieldController: nameCT,
                //   textFieldIcon: FontAwesomeIcons.hashtag,
                //   textFieldFormatterType: "",
                //   showTitle: true,
                //   onChanged: () {},
                //   isJustRead: true,
                //   isAutofocus: false,
                //   onTap: () {},
                // ),
                // StyledTextField(
                //   textFieldMaxLength: 11,
                //   textFieldHintText: "E-Posta",
                //   textFieldInputType: TextInputType.number,
                //   textFieldController: emailCT,
                //   textFieldIcon: FontAwesomeIcons.react,
                //   textFieldFormatterType: "",
                //   showTitle: true,
                //   onChanged: () {},
                //   isJustRead: true,
                //   isAutofocus: false,
                //   onTap: () {},
                // ),
                // StyledTextField(
                //   textFieldMaxLength: 11,
                //   textFieldHintText: "Telefon Numarası",
                //   textFieldInputType: TextInputType.number,
                //   textFieldController: phoneCT,
                //   textFieldIcon: FontAwesomeIcons.react,
                //   textFieldFormatterType: "",
                //   showTitle: true,
                //   onChanged: () {},
                //   isJustRead: true,
                //   isAutofocus: false,
                //   onTap: () {},
                // ),
                // Helper.roleId == 1
                //     ? StyledTextField(
                //         textFieldMaxLength: 11,
                //         textFieldHintText:
                //             AppLocalizations.of(context)!.ogrenciNo,
                //         textFieldInputType: TextInputType.number,
                //         textFieldController: ogrNo,
                //         textFieldIcon: "assets/images/star.png",
                //         textFieldFormatterType: "",
                //         showTitle: true,
                //         onChanged: () {},
                //         isJustRead: true,
                //         isAutofocus: false,
                //         onTap: () {},
                //       )
                //     :
                Container(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //     left: sizeConfig.heightSize(context, 30),
      //     right: sizeConfig.heightSize(context, 30),
      //     bottom: sizeConfig.heightSize(context, 30),
      //   ),
      //   child: StyledButton(
      //     buttonActivation: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const CustomBottomNavBar(),
      //         ),
      //       );
      //     },
      //     buttonText: "Giriş Yap",
      //     buttonTextColor: CustomTheme.darkColor,
      //     buttonWidth: 320,
      //   ),
      // ),
    );
  }
}
