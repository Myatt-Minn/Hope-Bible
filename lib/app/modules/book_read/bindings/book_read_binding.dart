import 'package:get/get.dart';

import '../controllers/book_read_controller.dart';

class BookReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookReadController>(
      () => BookReadController(),
    );
  }
}
