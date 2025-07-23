class TeacherUserModel {
  String? name;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  TeacherUserModel({
    this.name,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  TeacherUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
