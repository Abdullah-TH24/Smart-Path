class StudentUserModel {
  int? id;
  String? name;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  StudentUserModel({
    this.id,
    this.name,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  StudentUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['id'] = id;
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
