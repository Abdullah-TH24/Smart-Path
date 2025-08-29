import 'package:flutter/material.dart';
import 'package:smartpath/controller/student_controller/home_controller/grades_controller/filter_page_validation_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class DropFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final String title;
  final double menuHeight;
  const DropFieldComponent({
    super.key,
    required this.controller,
    required this.dropdownMenuEntries,
    required this.title,
    required this.menuHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleRegular16().copyWith(
              color: Colors.indigo[400],
            ),
          ),
          FormField<String>(
            validator: validationField,
            builder: (field) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownMenu<String>(
                    menuHeight: menuHeight,
                    controller: controller,
                    width: MediaQuery.sizeOf(context).width - 40,
                    inputDecorationTheme: const InputDecorationTheme(
                      border: UnderlineInputBorder(),
                    ),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.indigo[100],
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                      ),
                      fixedSize: WidgetStatePropertyAll(
                        Size(MediaQuery.sizeOf(context).width - 40, 150),
                      ),
                    ),
                    textStyle: AppStyles.styleRegular16().copyWith(
                      color: Colors.indigo,
                    ),
                    onSelected: (value) {
                      field.didChange(value);
                    },
                    dropdownMenuEntries: dropdownMenuEntries,
                  ),
                  if (field.hasError)
                    Text(
                      field.errorText!,
                      style: AppStyles.styleRegular12().copyWith(
                        color: Colors.red[900],
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
