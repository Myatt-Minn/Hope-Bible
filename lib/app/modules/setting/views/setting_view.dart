import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mPrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: AppColor.mPrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Font Size Tile
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.rBackground.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.settings, color: Colors.white),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Font Size',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'cfs'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => DropdownButton<int>(
                      value: controller.selectedFontSize.value,
                      dropdownColor: AppColor.rBackground,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(),
                      onChanged: (value) {
                        controller.updateFontSize(value!);
                      },
                      items: List.generate(
                        5,
                        (index) => DropdownMenuItem(
                          value: 14 + index * 2,
                          child: Text('${14 + index * 2}'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Language Tile
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.rBackground.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.language, color: Colors.white),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'change_language'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => ToggleButtons(
                          isSelected: [
                            controller.selectedLanguage.value == 'ENG',
                            controller.selectedLanguage.value == 'MYN'
                          ],
                          onPressed: (index) {
                            final language = index == 0 ? 'ENG' : 'MYN';
                            controller.toggleLanguage(
                                language); // Call to change language
                          },
                          selectedColor: Colors.white,
                          color: Colors.white,
                          fillColor: Colors.black,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text('ENG'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text('MYN'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // // Dark Mode Tile
            // Container(
            //   padding: const EdgeInsets.all(16.0),
            //   decoration: BoxDecoration(
            //     color: AppColor.rBackground.withOpacity(0.3),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.dark_mode, color: Colors.white),
            //       const SizedBox(width: 16),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Dark Mode',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(
            //               'Change dark mode/light mode',
            //               style: TextStyle(
            //                 color: Colors.white.withOpacity(0.8),
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Obx(
            //         () => Row(
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 controller.setDarkMode(true);
            //               },
            //               child: Row(
            //                 children: [
            //                   Icon(
            //                     Icons.check_circle,
            //                     color: controller.isDarkMode.value
            //                         ? Colors.green
            //                         : Colors.grey,
            //                   ),
            //                   const SizedBox(width: 4),
            //                   Text(
            //                     'On',
            //                     style: TextStyle(
            //                       color: controller.isDarkMode.value
            //                           ? Colors.green
            //                           : Colors.grey,
            //                       fontSize: 14,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(width: 16),
            //             GestureDetector(
            //               onTap: () {
            //                 controller.setDarkMode(false);
            //               },
            //               child: Row(
            //                 children: [
            //                   Icon(
            //                     Icons.radio_button_unchecked,
            //                     color: !controller.isDarkMode.value
            //                         ? Colors.green
            //                         : Colors.grey,
            //                   ),
            //                   const SizedBox(width: 4),
            //                   Text(
            //                     'Off',
            //                     style: TextStyle(
            //                       color: !controller.isDarkMode.value
            //                           ? Colors.green
            //                           : Colors.grey,
            //                       fontSize: 14,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
