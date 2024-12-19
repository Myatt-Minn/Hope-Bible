import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    print('splash onInit');
    super.onInit();
  }

  @override
  void onReady() async {
    print('splash onReady');
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed('/home');
    super.onReady();
  }

  void increment() => count.value++;
}
