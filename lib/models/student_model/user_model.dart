class User {
  int? id;
  String? name;
  String? middleName;
  String? lastName;
  String? email;
  String? role;

  User(
      {this.id,
      this.name,
      this.middleName,
      this.lastName,
      this.email,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
