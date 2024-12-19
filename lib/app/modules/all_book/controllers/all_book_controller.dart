import 'dart:convert';

import 'package:get/get.dart';
import 'package:hope_bible/app/data/ConstsConfig.dart';
import 'package:hope_bible/app/data/bookModel.dart';
import 'package:http/http.dart' as http;

class AllBookController extends GetxController {
  //TODO: Implement AllBookController

  var isLoading = false.obs;
  var books = <BookModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final url = '$baseUrl/books?is_4_limit=0';
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
        if (jsonData['data'] is List) {
          books.value = (jsonData['data'] as List)
              .map((data) => BookModel.fromJson(data))
              .toList();
          isLoading.value = false;
        } else {
          isLoading.value = false;
          throw Exception('Invalid data format');
        }
      } else {
        isLoading.value = false;
        throw Exception('Failed to load books');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching books: $e');
    }
  }
}
