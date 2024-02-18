class LoginRequestModel {
  String? tcNo;
  String? password;

  LoginRequestModel({this.tcNo, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    tcNo = json['tc_no'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tc_no'] = this.tcNo;
    data['password'] = this.password;
    return data;
  }
}
