// ignore_for_file: must_be_immutable

import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';

class Homeworks extends StatelessWidget {
  Homeworks({super.key});

  GlobalKey<FormState> homeworkKey = GlobalKey<FormState>();
  TextEditingController subject = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? xfile;
  File? file;

  List<String> subjects = [
    'history',
    'biology',
    'computer',
    'math',
    'chemistry',
    'physics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'grid_item_name_2'.tr),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => SizedBox(
                width: Get.width,
                height: 365,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.asset(
                        'assets/images/s_0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: Get.width - 10,
                      child: const Divider(color: Colors.black87),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              foregroundColor: Colors.indigo
                            ),
                            child: const Text('Upload'),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              // padding: EdgeInsets.zero,
                              foregroundColor: Colors.indigo 
                            ),
                            child: const Text('Download'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) =>
                  Container(height: 10, color: Colors.indigo[100]),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter(
//             child: GetBuilder<OperationType>(
//               init: OperationType(),
//               builder: (controller) {
//                 return Form(
//                   key: homeworkKey,
//                   child: Column(
//                     children: [
//                       const Gap(75),
//                       // Select Subject
//                       DropFieldComponent(
//                         title: 'Select a subject',
//                         menuHeight: 175,
//                         controller: subject,
//                         dropdownMenuEntries: List.generate(
//                           6,
//                           (index) => DropdownMenuEntry(
//                             value: 'Math',
//                             label: SubjectTranslator.translate(subjects[index]),
//                           ),
//                         ),
//                       ),
//                       const Gap(25),
//                       // Select Subject
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomHomeworkBtn(
//                             indexOp: 0,
//                             title: 'Upload',
//                             controller: controller,
//                             onPressed: () {
//                               controller.changeValue(0);
//                             },
//                           ),
//                           const Gap(10),
//                           CustomHomeworkBtn(
//                             indexOp: 1,
//                             title: 'Download',
//                             controller: controller,
//                             onPressed: () {
//                               controller.changeValue(1);
//                               xfile = null;
//                               file = null;
//                             },
//                           ),
//                         ],
//                       ),
//                       const Gap(25),
//                       // Image
//                       InkWell(
//                         onTap: controller.enableImage
//                             ? () async {
//                                 xfile = await picker.pickImage(
//                                   source: ImageSource.gallery,
//                                 );
//                                 file = File(xfile!.path);
//                                 controller.choosenImageVal(true);
//                               }
//                             : null,
//                         child: Container(
//                           width: Get.width - 40,
//                           height: 325,
//                           alignment: file != null ? null : Alignment.center,
//                           decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.circular(12.5),
//                             image: (file != null)
//                                 ? DecorationImage(
//                                     image: FileImage(file!),
//                                     fit: BoxFit.cover,
//                                   )
//                                 : null,
//                           ),
//                           // alignment: Alignment,
//                           child: (file != null)
//                               ? null
//                               // Image.file(file!, fit: BoxFit.cover,)
//                               : Text(
//                                   'Click to upload image',
//                                   style: TextStyle(
//                                     color: controller.enableImage
//                                         ? null
//                                         : Colors.black12,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       const Gap(25),
//                       // Download
//                       ElevatedButton(
//                         onPressed: controller.enableButton ? () {} : null,
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadiusGeometry.circular(12.5),
//                           ),
//                         ),
//                         child: Text(
//                           controller.indexOp == 1 ? 'Download' : 'Upload',
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

class OperationType extends GetxController {
  int indexOp = 1;
  bool enableImage = false;
  bool enableButton = true;
  bool choosenImage = false;

  changeValue(int indexOp) {
    this.indexOp = indexOp;
    if (indexOp == 0) {
      enableImage = true;
      enableButton = false;
    } else {
      enableButton = true;
      enableImage = false;
      choosenImage = false;
    }
    update();
  }

  choosenImageVal(bool val) {
    choosenImage = val;
    enableButton = true;
    update();
  }
}
