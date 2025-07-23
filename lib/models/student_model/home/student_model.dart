import 'package:smartpath/models/student_model/home/student_user_model.dart';

class StudentModel {
  int? id;
  int? userId;
  int? classId;
  String? schoolGraduatedFrom;
  String? photo;
  String? gpa;
  int? expelled;
  String? justification;
  String? createdAt;
  String? updatedAt;
  StudentUserModel? user;

  StudentModel({
    this.id,
    this.userId,
    this.classId,
    this.schoolGraduatedFrom,
    this.photo,
    this.gpa,
    this.expelled,
    this.justification,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    classId = json['class_id'];
    schoolGraduatedFrom = json['schoolGraduatedFrom'];
    photo = json['photo'];
    gpa = json['Gpa'];
    expelled = json['expelled'];
    justification = json['justification'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user =
        json['user'] != null ? StudentUserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['class_id'] = classId;
    data['schoolGraduatedFrom'] = schoolGraduatedFrom;
    data['photo'] = photo;
    data['Gpa'] = gpa;
    data['expelled'] = expelled;
    data['justification'] = justification;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
