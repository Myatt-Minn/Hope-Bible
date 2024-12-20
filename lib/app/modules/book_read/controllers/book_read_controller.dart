import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  RxInt fontSize = 14.obs; // Default font size

  @override
  void onInit() {
    super.onInit();
    // Initialize font size from storage or set default
    fontSize.value = GetStorage().read<int>('fontSize') ?? 14;
  }

  void saveFontSize(int size) {
    fontSize.value = size;
    GetStorage().write('fontSize', size);
  }
}
