import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    var mController = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: AppColor.rBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/photos/loading_screen_logo.png'),
            SizedBox(
              height: 29,
            ),
            const Text(
              'New Burmese Bible',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w700,
                color: AppColor.mPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
