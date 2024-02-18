import 'package:dio/dio.dart';
import 'package:teknopark_pdks/model/auth/Login/login_request_model.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  final String LoginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/login';
    }
  }
}
