class CommentModel {
  int? id;
  int? userId;
  int? parentId;
  String? name;
  String? middleName;
  String? lastName;
  String? email;
  String? role;
  String? content;
  int? reactionNumber;
  String? createdAt;
  List? replies;

  CommentModel({
    this.id,
    this.userId,
    this.parentId,
    this.name,
    this.middleName,
    this.lastName,
    this.email,
    this.role,
    this.content,
    this.reactionNumber,
    this.createdAt,
    this.replies,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    parentId = json['parent_id'];
    name = json['name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    content = json['content'];
    reactionNumber = json['reaction_number'];
    createdAt = json['created_at'];
    // if (json['replies'] != null) {
    //   replies = [];
    //   json['replies'].forEach((v) {
    //     replies!.add(fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['content'] = content;
    data['reaction_number'] = reactionNumber;
    data['created_at'] = createdAt;
    if (replies != null) {
      data['replies'] = replies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
