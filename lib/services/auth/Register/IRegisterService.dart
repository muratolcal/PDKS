import 'package:dio/dio.dart';
import 'package:teknopark_pdks/model/auth/Login/login_request_model.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/model/auth/Register/register_request_model.dart';
import 'package:teknopark_pdks/model/auth/Register/register_response_model.dart';
import 'package:teknopark_pdks/services/auth/Register/register_service.dart';

abstract class IRegisterService {
  final Dio dio;

  IRegisterService(this.dio);

  final String RegisterPath = IRegisterServicePath.REGISTER.rawValue;

  Future<RegisterResponseModel?> postUserRegister(RegisterRequestModel model);
}

enum IRegisterServicePath { REGISTER }

extension IRegisterServicePathExtension on IRegisterServicePath {
  String get rawValue {
    switch (this) {
      case IRegisterServicePath.REGISTER:
        return '/register';
    }
  }
}
