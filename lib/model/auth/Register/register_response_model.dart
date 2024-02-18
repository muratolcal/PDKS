import 'package:teknopark_pdks/model/auth/Login/user_data.dart';

class RegisterResponseModel {
  bool? status;
  //String? data;
  String? message;

  RegisterResponseModel({this.status, this.message});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
