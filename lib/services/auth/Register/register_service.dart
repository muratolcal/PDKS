import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teknopark_pdks/model/auth/Register/register_request_model.dart';
import 'package:teknopark_pdks/model/auth/Register/register_response_model.dart';
import 'package:teknopark_pdks/services/auth/Register/IRegisterService.dart';

class RegisterService extends IRegisterService {
  RegisterService(super.dio);

  @override
  Future<RegisterResponseModel?> postUserRegister(
      RegisterRequestModel model) async {
    final response = await dio.post(
      RegisterPath,
      data: model,
      options: Options(
        contentType: "application/json",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      return RegisterResponseModel.fromJson(response.data);
    }
  }
}
