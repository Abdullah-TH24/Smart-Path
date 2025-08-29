import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/global/complaints_controller/complaints_cubit.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/global/complaint_model.dart';

class ComplaintDialog extends StatefulWidget {
  final ComplaintModel complaint;
  final ComplaintsCubit cubit;

  const ComplaintDialog({
    super.key,
    required this.complaint,
    required this.cubit,
  });

  @override
  State<ComplaintDialog> createState() => _ComplaintDialogState();
}

class _ComplaintDialogState extends State<ComplaintDialog> {
  bool isEditing = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.complaint.complaint);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void saveEdit() {
    final newText = controller.text.trim();
    if (newText.isNotEmpty && newText != widget.complaint.complaint) {
      widget.cubit.editComplaint({
        'complaint_id': widget.complaint.id,
        'complaint': newText,
        'category': widget.complaint.category,
      });
      Get.back();
    }
    setState(() => isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: getColor().textField,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.complaint.category,
              style: AppStyles.styleBold24().copyWith(
                fontSize: 18,
                color: getColor().buttonText,
              ),
            ),
            Divider(indent: 32, endIndent: 32, color: getColor().buttonText),
            const Gap(12),
            isEditing
                ? TextField(
                    controller: controller,
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'edit_complaint'.tr),
                  )
                : Text(
                    widget.complaint.complaint,
                    style: AppStyles.styleRegular14(),
                    textAlign: TextAlign.start,
                  ),
            const Gap(20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Edit / Save Button
                TextButton.icon(
                  onPressed: () {
                    if (isEditing) {
                      saveEdit();
                    } else {
                      setState(() => isEditing = true);
                    }
                  },
                  icon: Icon(
                    isEditing ? Icons.save : Icons.edit,
                    color: const Color(0xFF818CF8),
                  ),
                  label: Text(
                    isEditing ? 'save'.tr : 'edit'.tr,
                    style: AppStyles.styleBold16().copyWith(
                      color: const Color(0xFF818CF8),
                    ),
                  ),
                ),

                const Gap(8),

                // Delete Button
                TextButton.icon(
                  onPressed: () {
                    widget.cubit.deleteComplaint(widget.complaint.id);
                    Get.back();
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: Text(
                    'delete'.tr,
                    style: AppStyles.styleBold16().copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
