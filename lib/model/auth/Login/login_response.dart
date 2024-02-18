import 'package:teknopark_pdks/model/auth/Login/user_data.dart';

class LoginResponseModel {
  bool? status;
  UserData? data;
  String? message;

  LoginResponseModel({this.status, this.data, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
