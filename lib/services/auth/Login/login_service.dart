import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknopark_pdks/model/auth/Login/login_request_model.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/services/auth/Login/ILoginService.dart';
import 'package:teknopark_pdks/utils/helper.dart';

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(
      LoginPath,
      data: model,
      options: Options(
          contentType: "application/json",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == HttpStatus.ok) {
      LoginResponseModel? loginResponse =
          LoginResponseModel.fromJson(response.data);
      return LoginResponseModel.fromJson(response.data);
    } else {
      return LoginResponseModel.fromJson(response.data);
    }
  }
}
