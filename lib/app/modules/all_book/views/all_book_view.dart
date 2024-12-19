import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/all_book_controller.dart';

class AllBookView extends GetView<AllBookController> {
  const AllBookView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mPrimary,
      appBar: AppBar(
        title: const Text(
          'အခြားစာအုပ်များ',
          style: TextStyle(color: AppColor.rPrimary),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColor.rPrimary),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColor.rPrimary,
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.menu,
          //     color: AppColor.rPrimary,
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // GridView with 2 columns
                  GridView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    shrinkWrap:
                        true, // Allow GridView to take only the needed space
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      childAspectRatio:
                          0.75, // Adjust the aspect ratio as needed
                    ),
                    itemCount:
                        controller.books.length, // Number of items in the grid
                    itemBuilder: (context, index) {
                      var book = controller.books[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/book-read', arguments: book);
                        },
                        child: Container(
                          width: 127, // Width of each item
                          height: 170, // Height of each item
                          margin:
                              EdgeInsets.all(8.0), // Margin around each item
                          decoration: BoxDecoration(
                            color: Colors.primaries[index %
                                Colors.primaries.length], // Color variation
                            borderRadius:
                                BorderRadius.circular(12), // Add border radius
                          ),
                          child: Column(
                            children: [
                              // Upper section for the image
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(
                                        12)), // Match the top border radius
                                child: Image.network(
                                  book.cover ??
                                      'https://static.scientificamerican.com/sciam/cache/file/1DDFE633-2B85-468D-B28D05ADAE7D1AD8_source.jpg?w=1200', // Replace with your image path
                                  width: double
                                      .infinity, // Match the container's width
                                  height: 176, // Adjust height as needed
                                  fit: BoxFit
                                      .cover, // Ensure the image covers the area
                                ),
                              ),
                              // Lower section for the button
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(
                                          12)), // Match the bottom border radius
                                  color: AppColor
                                      .rPrimary, // Background color for the button container
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // Button action
                                  },
                                  child: Text(
                                    book.title ?? 'Unknown',
                                    style: TextStyle(
                                        color: Colors.white), // Text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
      )),
    );
  }
}
