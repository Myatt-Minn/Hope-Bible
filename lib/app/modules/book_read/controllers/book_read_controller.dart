import 'package:get/get.dart';

class BookReadController extends GetxController {
  //TODO: Implement BookReadController

  bool showAllButtons = false;
  final RxBool isExpanded = false.obs;
  // Observable index to track the selected card
  var selectedRoomIndex = 0.obs;

  // Method to change the selected room
  void selectRoom(int index) {
    selectedRoomIndex.value = index;
  }
}
