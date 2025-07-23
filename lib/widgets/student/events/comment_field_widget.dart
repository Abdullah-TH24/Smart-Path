import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentField extends StatelessWidget {
  const CommentField({
    super.key,
    required this.comment,
    required this.commentFocus,
  });

  final TextEditingController comment;
  final FocusNode commentFocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 70,
      child: TextFormField(
        focusNode: commentFocus,
        controller: comment,
        decoration: InputDecoration(
          hint: Text('field_title'.tr),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.5)),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
        ),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: null,
      ),
    );
  }
}
