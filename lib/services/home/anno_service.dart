import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/model/auth/Login/user_data.dart';
import 'package:teknopark_pdks/model/home/anno_request_model.dart';
import 'package:teknopark_pdks/model/home/anno_response_model.dart';
import 'package:teknopark_pdks/services/home/IHomeService.dart';
import 'package:teknopark_pdks/utils/helper.dart';

class AnnoService extends IHomeService {
  AnnoService(super.dio);

  @override
  Future<AnnoResponseModel?> getAnnoData() async {
    String token = await Helper.getShared('token');

    final response = await dio.get(
      annoPath,
      data: null,
      options: Options(
          contentType: "application/json",
          headers: {
            'Authorization': token != "" ? 'Bearer ${token}' : "",
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == HttpStatus.ok) {
      return AnnoResponseModel.fromJson(response.data);
    } else {
      return AnnoResponseModel.fromJson(response.data);
    }
  }
}
