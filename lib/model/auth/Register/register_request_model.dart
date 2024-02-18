class RegisterRequestModel {
  String? companyID;
  String? name;
  String? surname;
  String? tcNo;
  String? mail;
  String? phone;
  String? password;

  RegisterRequestModel({
    required this.companyID,
    required this.name,
    required this.surname,
    required this.tcNo,
    required this.mail,
    required this.phone,
    required this.password,
  });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    companyID = json['firm_key'];
    name = json['name'];
    surname = json['surname'];
    tcNo = json['tc_no'];
    mail = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firm_key'] = companyID;
    data['name'] = name;
    data['surname'] = surname;
    data['email'] = mail;
    data['phone'] = phone;
    data['tc_no'] = tcNo;
    data['password'] = password;
    return data;
  }
}
