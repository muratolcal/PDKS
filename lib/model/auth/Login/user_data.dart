class UserData {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? tcNo;
  String? phone;
  String? profileImage;
  String? roleId;
  String? roleName;
  String? createdAt;
  String? formattedCreatedAt;
  String? token;

  UserData(
      {this.id,
      this.name,
      this.surname,
      this.email,
      this.tcNo,
      this.phone,
      this.profileImage,
      this.roleId,
      this.roleName,
      this.createdAt,
      this.formattedCreatedAt,
      this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    tcNo = json['tc_no'];
    phone = json['phone'];
    profileImage = json['profile_image'];
    roleId = json['role_id'];
    roleName = json['role_name'];
    createdAt = json['created_at'];
    formattedCreatedAt = json['formatted_created_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['tc_no'] = this.tcNo;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    data['created_at'] = this.createdAt;
    data['formatted_created_at'] = this.formattedCreatedAt;
    data['token'] = this.token;
    return data;
  }
}
