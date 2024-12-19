import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mPrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.mPrimary),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: AppColor.mPrimary,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu,
        //       color: AppColor.mPrimary,
        //     ),
        //   ),
        // ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          GFListTile(
            color: AppColor.rBackground.withAlpha(100),
            titleText: 'Font Size',
            avatar: Icon(Icons.settings),
            subTitleText: 'Change font size',
            icon: Icon(Icons.favorite),
          ),
          GFListTile(
            color: AppColor.rBackground.withAlpha(100),
            titleText: 'Language',
            avatar: Icon(Icons.language),
            subTitleText: 'Change language',
            icon: Icon(Icons.favorite),
          ),
          GFListTile(
            color: AppColor.rBackground.withAlpha(100),
            titleText: 'Dart Mode',
            avatar: Icon(Icons.dark_mode),
            subTitleText: 'Change dart mode/light mode',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
