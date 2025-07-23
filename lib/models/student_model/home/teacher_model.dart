import 'package:smartpath/models/student_model/home/teacher_user_model.dart';

class TeacherModel {
  int? id;
  int? userId;
  String? certification;
  String? photo;
  String? subject;
  String? salary;
  String? createdAt;
  String? updatedAt;
  TeacherUserModel? user;

  TeacherModel({
    this.id,
    this.userId,
    this.certification,
    this.photo,
    this.subject,
    this.salary,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    certification = json['certification'];
    photo = json['photo'];
    subject = json['subject'];
    salary = json['salary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user =
        json['user'] != null ? TeacherUserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['certification'] = certification;
    data['photo'] = photo;
    data['subject'] = subject;
    data['salary'] = salary;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
