import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/profile_data_model.dart';

class StudentModel {
  String? fullName;
  String? email;
  String? phone;
  String? role;
  int? userId;
  ProfileData? profileData;

  StudentModel({
    this.fullName,
    this.email,
    this.phone,
    this.role,
    this.profileData,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    prefs!.setString('user_id', userId.toString());
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    profileData =
        json['profile_data'] != null
            ? ProfileData.fromJson(json['profile_data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    if (profileData != null) {
      data['profile_data'] = profileData!.toJson();
    }
    return data;
  }
}
