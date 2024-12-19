import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hope_bible/app/data/literatureModel.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/read_controller.dart';

class ReadView extends GetView<ReadController> {
  const ReadView({super.key});

  @override
  Widget build(BuildContext context) {
    LiteratureModel literatureModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.mPrimary),
        title: Text(
          literatureModel.title!,
          style: TextStyle(
            color: AppColor.mPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.isExpanded.value =
                    !controller.isExpanded.value; // Toggle the expansion state
              },
              child: Obx(
                () => Container(
                  width: double.infinity,
                  color: AppColor.mPrimary,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 8.0, // Horizontal space between elements
                          runSpacing:
                              10.0, // Vertical space between wrapped rows
                          children: List.generate(
                            controller.isExpanded.value
                                ? literatureModel.rooms?.length ?? 0
                                : (literatureModel.rooms?.length ?? 0)
                                    .clamp(0, 4),
                            (index) => GestureDetector(
                              onTap: () {
                                controller.selectRoom(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 4),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  color: controller.selectedRoomIndex.value ==
                                          index
                                      ? Colors.white
                                      : Color(0xFF8718FD),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'အခန်း ${index + 1}',
                                  style: TextStyle(
                                    color: controller.selectedRoomIndex.value ==
                                            index
                                        ? Colors.purple
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Arrow down/up icon for toggling view
                      GestureDetector(
                        onTap: () {
                          controller.isExpanded.value =
                              !controller.isExpanded.value;
                        },
                        child: Icon(
                          controller.isExpanded.value
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => HtmlWidget(
                    literatureModel.rooms![controller.selectedRoomIndex.value]
                            .content ??
                        'No Content Found',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
