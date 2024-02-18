import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teknopark_pdks/model/auth/Login/login_request_model.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/model/home/anno_response_model.dart';
import 'package:teknopark_pdks/services/auth/Login/ILoginService.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController? tcController;
  final TextEditingController? passwordController;
  final GlobalKey<FormState>? formKey;
  final ILoginService? service;

  bool isLoginFail = false;
  bool isLoading = false;
  LoginResponseModel? loginModel;

  LoginCubit(
      this.tcController, this.passwordController, this.formKey, this.service)
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey?.currentState != null && formKey!.currentState!.validate()) {
      changeLoadingView();
      final data = await service?.postUserLogin(
        LoginRequestModel(
          tcNo: tcController?.text.trim(),
          password: passwordController?.text.trim(),
        ),
      );
      changeLoadingView();

      if (data is LoginResponseModel) {
        emit(
          LoginSuccesful(data),
        );
      } else {
        emit(
          LoginFailed(message: 'Kullanıcı adı veya şifre yanlış'),
        );
      }
    } else {
      var isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading));
  }
}
