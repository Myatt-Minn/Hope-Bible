import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hope_bible/app/data/MyTranslations.dart';

import 'app/routes/app_pages.dart';

void main() {
  String? savedLanguage = GetStorage().read('language') ?? 'MYN';
  runApp(
    GetMaterialApp(
      translations: MyTranslations(),
      // Set the locale dynamically based on the saved language
      locale: savedLanguage == 'ENG'
          ? const Locale('en', 'US')
          : const Locale('my', 'MM'),
      fallbackLocale:
          const Locale('en', 'US'), // Set a fallback language (e.g., English)
      title: "Hope Bible",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
