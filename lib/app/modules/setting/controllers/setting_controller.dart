import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  // Reactive variables
  var selectedFontSize = 16.obs; // Default font size
  var isEnglish = true.obs; // Default language is English
  var isDarkMode = false.obs; // Default mode is Light Mode
  var selectedLanguage = 'MYN'.obs;
  var goDarkMode = true.obs;
  var notificationsEnabled = true.obs;
  var languageSelected = 'Myanmar'.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value = storage.read('language') ?? 'MYN';
    updateLocale();
    loadSettings();
  }

  // Update font size
  void updateFontSize(int newSize) {
    selectedFontSize.value = newSize;
    saveFontSize(newSize); // Persist setting
  }

  void updateLocale() {
    if (selectedLanguage.value == 'ENG') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('my', 'MM'));
    }
  }

  void toggleLanguage(String language) {
    selectedLanguage.value = language;
    storage.write('language', language); // Save to storage
    updateLocale(); // Apply the new language
  }

  // Set dark mode (true for dark, false for light)
  void setDarkMode(bool value) {
    isDarkMode.value = value;
    saveDarkMode(value); // Persist setting
  }

  // Persist font size
  void saveFontSize(int size) {
    GetStorage().write('fontSize', size);
  }

  // Persist language setting
  void saveLanguage(bool isEng) {
    GetStorage().write('language', isEng ? 'ENG' : 'MYN');
  }

  // Persist dark mode setting
  void saveDarkMode(bool isDark) {
    GetStorage().write('darkMode', isDark);
  }

  // Load settings from storage
  void loadSettings() {
    // Load font size
    int? savedFontSize = GetStorage().read('fontSize');
    if (savedFontSize != null) {
      selectedFontSize.value = savedFontSize;
    }

    // Load language
    String? savedLanguage = GetStorage().read('language');
    if (savedLanguage != null) {
      isEnglish.value = savedLanguage == 'ENG';
    }

    // Load dark mode
    bool? savedDarkMode = GetStorage().read('darkMode');
    if (savedDarkMode != null) {
      isDarkMode.value = savedDarkMode;
    }
  }
}
