import 'package:smartpath/controller/student_controller/events/delete_comments_controller.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/comment_model.dart';

deleteAllCommentRelated(
  List<Replies> replies,
  DeleteCommentsController deleteComment,
) async {
  for (var i = 0; i < replies.length; i++) {
    await deleteComment.deleteComment(
      prefs!.getString('token')!,
      replies[i].id!,
    );
    if (replies[i].replies != null) {
      deleteAllCommentRelated(replies[i].replies!, deleteComment);
    }
  }
}
