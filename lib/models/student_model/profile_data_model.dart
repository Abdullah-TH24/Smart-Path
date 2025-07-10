class ProfileData {
  String? photo;
  String? shoolGraduatedFrom;
  String? gpa;
  String? className;
  int? numberOfAttendanceYears;

  ProfileData({
    this.photo,
    this.shoolGraduatedFrom,
    this.gpa,
    this.className,
    this.numberOfAttendanceYears,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    shoolGraduatedFrom = json['shool-graduated-from'];
    gpa = json['gpa'];
    className = json['class_name'];
    numberOfAttendanceYears = json['number of attendance years'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['shool-graduated-from'] = shoolGraduatedFrom;
    data['gpa'] = gpa;
    data['class_name'] = className;
    data['number of attendance years'] = numberOfAttendanceYears;
    return data;
  }
}
