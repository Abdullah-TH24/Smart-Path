import 'package:smartpath/models/student_model/user_model.dart';

class AllReactionsModel {
  User? user;
  int? reactionId;
  String? reactionType;
  String? createdAt;
  String? updatedAt;

  AllReactionsModel(
      {this.user,
      this.reactionId,
      this.reactionType,
      this.createdAt,
      this.updatedAt});

  AllReactionsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    reactionId = json['reaction_id'];
    reactionType = json['reaction_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['reaction_id'] = reactionId;
    data['reaction_type'] = reactionType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
