import 'package:smartpath/models/student_model/media_model.dart';

class EventsModel {
  int? id;
  int? userId;
  String? publisherName;
  String? email;
  String? eventName;
  String? post;
  int? isPublished;
  int? commentNumber;
  int? reactionNumber;
  String? createdAt;
  String? updatedAt;
  String? role;
  List<Media>? media;

  EventsModel({
    this.id,
    this.userId,
    this.publisherName,
    this.email,
    this.eventName,
    this.post,
    this.isPublished,
    this.commentNumber,
    this.reactionNumber,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.media,
  });

  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    publisherName = json['publisherName'];
    email = json['email'];
    eventName = json['event_name'];
    post = json['post'];
    isPublished = json['is_published'];
    commentNumber = json['comment_number'];
    reactionNumber = json['reaction_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['publisherName'] = publisherName;
    data['email'] = email;
    data['event_name'] = eventName;
    data['post'] = post;
    data['is_published'] = isPublished;
    data['comment_number'] = commentNumber;
    data['reaction_number'] = reactionNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
