import 'dart:convert';

import 'package:get/get.dart';
import 'package:hope_bible/app/data/ConstsConfig.dart';
import 'package:hope_bible/app/data/bookModel.dart';
import 'package:hope_bible/app/data/literatureModel.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var newLiteratures = <LiteratureModel>[].obs;
  var oldLiteratures = <LiteratureModel>[].obs;
  var books = <BookModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewLiteratures();
    fetchOldLiteratures();
    fetch4Books();
  }

  Future<void> fetchNewLiteratures() async {
    final url = '$baseUrl/literatures?is_new=1';
    // final authService = Tokenhandler();
    // final token = await authService.getToken();
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Check if 'data' key exists and is a list
        if (jsonData['data'] is List) {
          newLiteratures.value = (jsonData['data'] as List)
              .map((data) => LiteratureModel.fromJson(data))
              .toList();
          isLoading.value = false;
        } else {
          isLoading.value = false;
          throw Exception('Invalid data format');
        }
      } else {
        isLoading.value = false;
        throw Exception('Failed to load literatures');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching literaturess: $e');
    }
  }

  Future<void> fetchOldLiteratures() async {
    final url = '$baseUrl/literatures?is_new=0';
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
          oldLiteratures.value = (jsonData['data'] as List)
              .map((data) => LiteratureModel.fromJson(data))
              .toList();
          isLoading.value = false;
        } else {
          isLoading.value = false;
          throw Exception('Invalid data format');
        }
      } else {
        isLoading.value = false;
        throw Exception('Failed to load literatures');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching literatures: $e');
    }
  }

  Future<void> fetch4Books() async {
    final url = '$baseUrl/books?is_4_limit=1';
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
