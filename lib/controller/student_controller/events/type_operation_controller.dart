import 'package:get/get.dart';

class TypeOperation extends GetxController {
  bool addComment = true;
  bool editComment = false;
  bool addReply = false;
  bool editReply = false;
  int commentId = 0;

  changeCommentId(int value) {
    commentId = value;
    update();
  }

  makeAllOthersVarsFalse() {
    addComment = false;
    editComment = false;
    addReply = false;
    editReply = false;
  }

  reDeclare() {
    addComment = true;
    editComment = false;
    addReply = false;
    editReply = false;
  }

  changeEditComment(bool value) {
    makeAllOthersVarsFalse();
    editComment = value;
  }

  changeAddReply(bool value) {
    makeAllOthersVarsFalse();
    addReply = value;
  }

  changeEditReply(bool value) {
    makeAllOthersVarsFalse();
    editReply = value;
  }
}
