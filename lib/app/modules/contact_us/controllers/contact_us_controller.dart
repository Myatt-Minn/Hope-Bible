import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope_bible/app/data/ConstsConfig.dart';
import 'package:hope_bible/app/data/contactModel.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  //TODO: Implement ContactUsController

  var isLoading = false.obs;
  var contactData = Rxn<ContactModel>();

  @override
  void onInit() {
    super.onInit();
    fetchContact();
  }

  Future<void> fetchContact() async {
    final url = '$baseUrl/contact';
    // final authService = Tokenhandler();
    // final token = await authService.getToken();
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          // 'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Check if 'data' key exists and is a list

        contactData.value = ContactModel.fromJson(jsonData['data']);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception('Failed to load books');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching books: $e');
    }
  }

  void goToWebsite(String websiteLink) async {
    Uri url = Uri.parse(websiteLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Cannot open the website',
        'Something wrong with Internet Connection or the app!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
