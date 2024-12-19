import 'package:get/get.dart';

import '../controllers/all_book_controller.dart';

class AllBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllBookController>(
      () => AllBookController(),
    );
  }
}
