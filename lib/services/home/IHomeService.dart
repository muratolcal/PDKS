import 'package:dio/dio.dart';
import 'package:teknopark_pdks/model/home/anno_request_model.dart';
import 'package:teknopark_pdks/model/home/anno_response_model.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  final String annoPath = IHomeServicePath.ANNO.rawValue;

  Future<AnnoResponseModel?> getAnnoData();
}

enum IHomeServicePath { ANNO }

extension IHomeServicePathExtension on IHomeServicePath {
  String get rawValue {
    switch (this) {
      case IHomeServicePath.ANNO:
        return '/announcement';
    }
  }
}
