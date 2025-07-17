import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/events/current_page_controller.dart';

class ImagesPost extends StatelessWidget {
  final EventsController controller;
  final int index;
  const ImagesPost({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentPageController>(
      init: CurrentPageController(length: controller.events!.length),
      builder: (curController) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 300,
              width: Get.width,
              child: PageView.builder(
                onPageChanged: (page) {
                  curController.setCurrentPage(index, page + 1);
                },
                controller: controller.pages[index],
                itemCount: controller.events![index].media!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, ind) {
                  return SizedBox(
                    height: 300,
                    child: Image.network(
                      controller.events![index].media![ind].url!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // <1 / length> images
            Positioned(
              right: 10,
              top: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2.5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: Text(
                  '${curController.currentPages[index]} / ${controller.events![index].media!.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
