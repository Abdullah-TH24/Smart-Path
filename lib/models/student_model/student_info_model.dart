class StudentInfo {
  String? name;
  String? middleName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? role;
  String? className;
  String? schoolGraduatedFrom;
  String? photo;
  String? gpa;
  int? expelled;
  String? justification;

  StudentInfo({
    this.name,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.role,
    this.className,
    this.schoolGraduatedFrom,
    this.photo,
    this.gpa,
    this.expelled,
    this.justification,
  });

  StudentInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    role = json['role'];
    className = json['className'];
    schoolGraduatedFrom = json['schoolGraduatedFrom'];
    photo = json['photo'];
    gpa = json['Gpa'];
    expelled = json['expelled'];
    justification = json['justification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['role'] = role;
    data['className'] = className;
    data['schoolGraduatedFrom'] = schoolGraduatedFrom;
    data['photo'] = photo;
    data['Gpa'] = gpa;
    data['expelled'] = expelled;
    data['justification'] = justification;
    return data;
  }
}
