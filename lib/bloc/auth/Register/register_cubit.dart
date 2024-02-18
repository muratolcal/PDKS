import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teknopark_pdks/bloc/auth/login/login_cubit.dart';
import 'package:teknopark_pdks/model/auth/Register/register_request_model.dart';
import 'package:teknopark_pdks/model/auth/Register/register_response_model.dart';
import 'package:teknopark_pdks/services/auth/Register/IRegisterService.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController tcController;
  final TextEditingController companyIDController;
  final TextEditingController mailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final IRegisterService service;

  bool isLoginFail = false;
  bool isLoading = false;

  RegisterCubit(
      this.formKey,
      this.nameController,
      this.surnameController,
      this.tcController,
      this.companyIDController,
      this.mailController,
      this.phoneController,
      this.passwordController,
      {required this.service})
      : super(RegisterInitial());

  Future<void> postUserRegister() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final data = await service.postUserRegister(RegisterRequestModel(
        companyID: companyIDController.text.trim(),
        name: nameController.text.trim(),
        surname: surnameController.text.trim(),
        tcNo: tcController.text.trim(),
        mail: mailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
      ));
      changeLoadingView();

      if (data is RegisterResponseModel) {
        if (data.status == true) {
          emit(RegisterSuccessful(message: data.message ?? 'Giriş Başarılı'));
        } else {
          emit(RegisterFailed(message: data.message ?? 'Hata'));
        }
      }
    } else {
      bool isLoginFail = true;
      emit(RegisterValidate(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(RegisterIsLoading(isLoading));
  }
}
