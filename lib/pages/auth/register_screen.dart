import 'package:dio/dio.dart';
import 'package:teknopark_pdks/bloc/auth/Register/register_cubit.dart';
import 'package:teknopark_pdks/bloc/auth/login/login_cubit.dart';
import 'package:teknopark_pdks/pages/Auth/login.dart';
import 'package:teknopark_pdks/services/auth/Register/register_service.dart';
import 'package:teknopark_pdks/theme/size_config.dart';
import 'package:teknopark_pdks/theme/spaces.dart';
import 'package:teknopark_pdks/theme/theme_settings.dart';
import 'package:teknopark_pdks/widgets/button_widget.dart';
import 'package:teknopark_pdks/widgets/custom_snackbar.dart';
import 'package:teknopark_pdks/widgets/image_widget.dart';
import 'package:teknopark_pdks/widgets/styled_popup.dart';
import 'package:teknopark_pdks/widgets/styled_textfield.dart';
import 'package:teknopark_pdks/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknopark_pdks/services/base_service.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController tcController = TextEditingController();
  final TextEditingController companyIDController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool rememberMe = false;
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        formKey,
        nameController,
        surnameController,
        tcController,
        companyIDController,
        mailController,
        phoneController,
        passwordController,
        service: RegisterService(
          Dio(
            BaseOptions(baseUrl: BaseService.baseUrl),
          ),
        ),
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
        if (state is RegisterSuccessful) {
          StyledPopup(
              image: 'logo.png',
              context: context,
              title: 'Teknopark PDKS',
              description: state.message,
              type: 1,
              btn1: 'Tamam',
              btn2: '',
              isTwoButton: false,
              onTap1: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }).show();
        } else if (state is RegisterFailed) {
          CustomSnackBar(context, state.message, type: false);
        }
      }, builder: (context, state) {
        return _registerScafflod(context, state);
      }),
    );
  }

  Scaffold _registerScafflod(BuildContext context, RegisterState state) {
    return Scaffold(
      backgroundColor: CustomTheme.white,
      resizeToAvoidBottomInset: true,
      body: _registerBody(state, context),
    );
  }

  Form _registerBody(RegisterState state, BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: state is RegisterValidate
          ? (state.isValid
              ? AutovalidateMode.always
              : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: SizeConfig().widthSize(context, 340),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageArea(
                  heightSize: 100,
                  widthSize: 150,
                  imageName: 'logo.png',
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: StyledText(
                    styledString: "Başlayalım!",
                    styledFontSize: 36,
                    styledWeight: FontWeight.w500,
                    styledColor: Colors.black,
                    letterSpace: 2.0,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: StyledText(
                    styledString: "Ücretsiz hesap oluştur.",
                    styledFontSize: 15,
                    styledWeight: FontWeight.w400,
                    styledColor: Colors.black,
                    letterSpace: 1.0,
                  ),
                ),
                Spaces.smallSpace(context),
                StyledTextField(
                  text: 'Şirket ID',
                  validate: (validate) {
                    if (validate!.isEmpty) {
                      return 'Bu alan boş olamaz';
                    } else if (validate.length != 8) {
                      return '8 haneli bir kod girmeniz gerekmektedir.';
                    }
                  },
                  textFieldHintText: 'Şirket ID',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: companyIDController,
                  textFieldIcon: Icons.business,
                ),
                StyledTextField(
                  text: 'Ad',
                  validate: (validate) {
                    return validate!.isEmpty ? 'Bu alan boş olamaz' : null;
                  },
                  textFieldHintText: 'Ad',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: nameController,
                  textFieldIcon: Icons.person,
                ),
                StyledTextField(
                  text: 'Soyad',
                  validate: (validate) {
                    return validate!.isEmpty ? 'Bu alan boş olamaz' : null;
                  },
                  textFieldHintText: 'Soyad',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: surnameController,
                  textFieldIcon: Icons.person,
                ),
                StyledTextField(
                  text: 'T.C Kimlik No',
                  validate: (validate) {
                    if (validate!.isEmpty) {
                      return 'Bu alan boş olamaz';
                    } else if (validate.length != 11) {
                      return '11 hane olmalıdır.';
                    }
                  },
                  textFieldHintText: 'T.C Kimlik No',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: tcController,
                  textFieldIcon: Icons.numbers,
                ),
                StyledTextField(
                  text: 'Mail Adresi',
                  validate: (validate) {
                    if (validate!.isEmpty) {
                      return 'Bu alan boş olamaz';
                    } else if (validate.contains('@') == false) {
                      return 'Hatalı mail adresi girdiniz';
                    }
                  },
                  textFieldHintText: 'Mail Adresi',
                  textFieldMaxLength: 11,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: mailController,
                  textFieldIcon: Icons.mail,
                ),
                StyledTextField(
                  text: 'Telefon Numarası',
                  validate: (validate) {
                    if (validate!.isEmpty) {
                      return 'Bu alan boş olamaz';
                    } else if (validate.length < 10) {
                      return 'Eksik numara girdiniz';
                    }
                  },
                  textFieldHintText: 'Telefon Numarası',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.phone,
                  showTitle: true,
                  textFieldController: phoneController,
                  textFieldIcon: Icons.phone,
                ),
                StyledTextField(
                  text: 'Şifre',
                  validate: (validate) {
                    return validate!.isEmpty ? 'Bu alan boş olamaz' : null;
                  },
                  textFieldHintText: 'Şifre',
                  textFieldMaxLength: 25,
                  textFieldInputType: TextInputType.name,
                  showTitle: true,
                  textFieldController: passwordController,
                  textFieldIcon: Icons.password,
                ),
                Spaces.smallSpace(context),
                Visibility(
                  visible: context.watch<RegisterCubit>().isLoading,
                  child: CircularProgressIndicator(),
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return StyledButton(
                      buttonText: 'Kayıt Ol',
                      buttonTextColor: CustomTheme.white,
                      buttonActivation: () {
                        context.read<RegisterCubit>().postUserRegister();
                      },
                    );
                  },
                ),
                Spaces.miniSpace(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const StyledText(
                      styledString: 'Bir hesabın var mı ?',
                      styledFontSize: 15,
                      styledWeight: FontWeight.w800,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: const StyledText(
                          styledString: 'Giriş Yap!',
                          styledFontSize: 15,
                          styledColor: CustomTheme.primaryColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
