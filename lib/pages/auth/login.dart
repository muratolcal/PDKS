import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknopark_pdks/bloc/auth/login/login_cubit.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/pages/Auth/forgot_password.dart';
import 'package:teknopark_pdks/pages/Auth/register_screen.dart';
import 'package:teknopark_pdks/pages/Home/home.dart';
import 'package:teknopark_pdks/services/auth/Login/login_service.dart';
import 'package:teknopark_pdks/services/base_service.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/custom_snackbar.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  SizeConfig sizeConfig = SizeConfig();
  TextEditingController tcNoCT = TextEditingController();
  TextEditingController passwordCT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        tcNoCT,
        passwordCT,
        formKey,
        LoginService(
          Dio(
            BaseOptions(baseUrl: BaseService.baseUrl),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccesful) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (state is LoginFailed) {
            CustomSnackBar(context, 'T.C No veya hatalı şifre girdiniz.',
                type: false);
          }
        },
        builder: (context, state) {
          return _loginScaffold(context, state);
        },
      ),
    );
  }

  Scaffold _loginScaffold(BuildContext context, LoginState state) {
    bool rememberMe = false;

    return Scaffold(
      backgroundColor: CustomTheme.white,
      body: _loginBody(context, state, rememberMe),
      bottomNavigationBar: _loginBottomNavigationBar(context),
    );
  }

  Padding _loginBottomNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: sizeConfig.heightSize(context, 30),
        right: sizeConfig.heightSize(context, 30),
        bottom: sizeConfig.heightSize(context, 30),
      ),
      child: StyledButton(
        buttonActivation: () {
          context.read<LoginCubit>().postUserModel();
        },
        buttonText: 'Giriş Yap',
        buttonTextColor: CustomTheme.white,
        buttonWidth: sizeConfig.widthSize(context, 100),
      ),
    );
  }

  SafeArea _loginBody(BuildContext context, LoginState state, bool rememberMe) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: sizeConfig.widthSize(context, 320),
            child: Form(
              key: formKey,
              autovalidateMode: state is LoginValidateState
                  ? (state.isValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled)
                  : AutovalidateMode.disabled,
              child: Center(
                child: Column(
                  children: [
                    Spaces.midSpace(context),
                    Image.asset(
                      "assets/images/logo.png",
                      height: sizeConfig.heightSize(context, 80),
                    ),
                    Spaces.midSpace(context),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: StyledText(
                        styledString: "Hoşgeldiniz.",
                        styledFontSize: 36,
                        styledWeight: FontWeight.w500,
                        styledColor: CustomTheme.darkColor,
                        letterSpace: 2.0,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: StyledText(
                        styledString: "Hesabınıza erişmek için giriş yapınız.",
                        styledFontSize: 14,
                        styledWeight: FontWeight.w500,
                        styledColor: CustomTheme.darkColor,
                      ),
                    ),
                    Spaces.smallSpace(context),
                    StyledTextField(
                      validate: (validate) {
                        if (validate!.isEmpty) {
                          return 'Bu alan boş olamaz';
                        } else if (validate.length != 11) {
                          return 'T.C No kısmı 11 hane olmalıdır';
                        }
                      },
                      textFieldMaxLength: 11,
                      textFieldHintText: 'T.C Kimlik No',
                      textFieldInputType: TextInputType.number,
                      textFieldController: tcNoCT,
                    ),
                    StyledTextField(
                      validate: (validate) {
                        if (validate!.isEmpty) {
                          return 'Bu alan boş olamaz';
                        }
                      },
                      textFieldMaxLength: 25,
                      textFieldHintText: 'Şifreniz',
                      textFieldInputType: TextInputType.name,
                      textFieldController: passwordCT,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: CustomTheme.secondColor,
                            value: rememberMe,
                            onChanged: (value) {}),
                        const Text("Beni Hatırla"),
                        Spaces.bigWSpace(context),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()),
                            );
                          },
                          child: const StyledText(
                            styledString: "Şifremi Unuttum",
                            styledFontSize: 16,
                            styledWeight: FontWeight.w600,
                            styledColor: CustomTheme.darkColor,
                            styledDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: context.watch<LoginCubit>().isLoading,
                      child: CircularProgressIndicator(),
                    ),
                    Spaces.midSpace(context),
                    TextButton(
                      child: StyledText(
                        styledString: 'Kayıt olmak için tıklayınız',
                        styledFontSize: 15,
                        styledColor: CustomTheme.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginUser() async {
    context.read<LoginCubit>().postUserModel();
  }
}
