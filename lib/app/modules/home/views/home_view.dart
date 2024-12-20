import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:getwidget/components/drawer/gf_drawer_header.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.mPrimary,
      endDrawer: GFDrawer(
        color: AppColor.rBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.mPrimary,
              ),
              centerAlign: true,
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/photos/contactus_logo.png'),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Hope Bible',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.rBackground),
                  ),
                  Text(
                    'Burmese Version: v 0.0.1beta-ui-only',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.rBackground,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'gofirstpage'.tr,
                style: TextStyle(
                  color: AppColor.mPrimary,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: AppColor.mPrimary,
              ),
              onTap: () => Get.offAllNamed('/home'),
            ),
            Divider(
              color: Colors.grey, // Color of the divider
              thickness: 1, // Thickness of the divider
              height: 6, // Space around the divider
              indent: 16, // Space to indent from the left
              endIndent: 16, // Space to indent from the right
            ),
            ListTile(
              title: Text(
                'tableofcontents'.tr,
                style: TextStyle(color: AppColor.mPrimary),
              ),
              leading: Icon(
                Icons.pages,
                color: AppColor.mPrimary,
              ),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              color: Colors.grey, // Color of the divider
              thickness: 1, // Thickness of the divider
              height: 6, // Space around the divider
              indent: 16, // Space to indent from the left
              endIndent: 16, // Space to indent from the right
            ),
            ListTile(
              title: Text(
                'otherbooks'.tr,
                style: TextStyle(
                  color: AppColor.mPrimary,
                ),
              ),
              leading: Icon(
                Icons.book,
                color: AppColor.mPrimary,
              ),
              onTap: () => Get.toNamed('/all-book'),
            ),
            Divider(
              color: Colors.grey, // Color of the divider
              thickness: 1, // Thickness of the divider
              height: 6, // Space around the divider
              indent: 16, // Space to indent from the left
              endIndent: 16, // Space to indent from the right
            ),
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(
                  color: AppColor.mPrimary,
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: AppColor.mPrimary,
              ),
              onTap: () => Get.toNamed('/setting'),
            ),
            Divider(
              color: Colors.grey, // Color of the divider
              thickness: 1, // Thickness of the divider
              height: 6, // Space around the divider
              indent: 16, // Space to indent from the left
              endIndent: 16, // Space to indent from the right
            ),
            ListTile(
              title: Text(
                'contact_us'.tr,
                style: TextStyle(
                  color: AppColor.mPrimary,
                ),
              ),
              leading: Icon(
                Icons.contact_emergency,
                color: AppColor.mPrimary,
              ),
              onTap: () => Get.toNamed('/contact-us'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar as a Container
            Container(
              height: 100, // Set your desired height
              color: AppColor.rBackground, // Background color of the AppBar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Image.asset('assets/photos/homepage_logo.png'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          return _scaffoldKey.currentState!.openEndDrawer();
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),

            // Expanded SingleChildScrollView for the body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox for spacing
                    SizedBox(height: 16),
                    // Title Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'tableofcontents'.tr,
                          style: TextStyle(
                            color: AppColor.rBackground,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    // First GridView
                    Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator()
                          : controller.newLiteratures.isEmpty
                              ? SizedBox()
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: GridView.builder(
                                    physics:
                                        NeverScrollableScrollPhysics(), // Disable GridView scrolling
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5, // 5 columns
                                      childAspectRatio:
                                          1, // Aspect ratio of grid items
                                    ),
                                    itemCount: controller.newLiteratures
                                        .length, // 40 items for 8 rows
                                    shrinkWrap:
                                        true, // Allow GridView to take only the needed space
                                    itemBuilder: (context, index) {
                                      var literature =
                                          controller.newLiteratures[index];
                                      return GestureDetector(
                                        onTap: () => Get.toNamed('/read',
                                            arguments: literature),
                                        child: Container(
                                          margin: EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            color: AppColor.mBackground
                                                .withAlpha(
                                                    60), // Color variation
                                            borderRadius: BorderRadius.circular(
                                                12), // Add border radius
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                    ),

                    // SizedBox for spacing above the divider
                    SizedBox(height: 16), // Adjust the height as needed

                    Divider(
                      color: Colors.grey, // Color of the line
                      thickness: 1, // Thickness of the line
                      height: 20, // Space around the line
                      indent: 16,
                      endIndent: 16,
                    ),

                    // Second GridView
                    // First GridView
                    Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator()
                          : controller.oldLiteratures.isEmpty
                              ? SizedBox()
                              : Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: GridView.builder(
                                    physics:
                                        NeverScrollableScrollPhysics(), // Disable GridView scrolling
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5, // 5 columns
                                      childAspectRatio:
                                          1, // Aspect ratio of grid items
                                    ),
                                    itemCount: controller.oldLiteratures
                                        .length, // 40 items for 8 rows
                                    shrinkWrap:
                                        true, // Allow GridView to take only the needed space
                                    itemBuilder: (context, index) {
                                      var literature =
                                          controller.oldLiteratures[index];
                                      return GestureDetector(
                                        onTap: () => Get.toNamed('/read',
                                            arguments: literature),
                                        child: Container(
                                          margin: EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            color: AppColor.mBackground
                                                .withAlpha(
                                                    60), // Color variation
                                            borderRadius: BorderRadius.circular(
                                                12), // Add border radius
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                    ),
                    SizedBox(height: 16), // Adjust the height as needed

                    Divider(
                      color: Colors.grey, // Color of the line
                      thickness: 1, // Thickness of the line
                      height: 20, // Space around the line
                      indent: 16,
                      endIndent: 16,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'otherbooks'.tr,
                            style: TextStyle(
                              color: AppColor.rBackground,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed('/all-book'),
                            child: Row(
                              children: [
                                Text(
                                  'lookall'.tr,
                                  style: TextStyle(
                                    color: AppColor.rBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: AppColor.rBackground,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis
                            .horizontal, // Set scroll direction to horizontal
                        child: Obx(
                          () => controller.isLoading.value
                              ? CircularProgressIndicator()
                              : controller.books.isEmpty
                                  ? SizedBox()
                                  : Row(
                                      children: List.generate(
                                          controller.books.length, (index) {
                                        var book = controller.books[index];
                                        return Container(
                                          width: 127, // Width of each item
                                          height: 218, // Height of each item
                                          margin: EdgeInsets.all(
                                              8.0), // Margin around each item
                                          decoration: BoxDecoration(
                                            color: Colors.primaries[index %
                                                Colors.primaries
                                                    .length], // Color variation
                                            borderRadius: BorderRadius.circular(
                                                12), // Add border radius
                                          ),
                                          child: GestureDetector(
                                            onTap: () => Get.toNamed(
                                                '/book-read',
                                                arguments: book),
                                            child: Column(
                                              children: [
                                                // Upper section for the image
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              12)), // Match the top border radius
                                                  child: book.cover == null ||
                                                          book.cover!.isEmpty
                                                      ? Image.asset(
                                                          'assets/book.png')
                                                      : Image.network(
                                                          book.cover!, // Replace with your image path
                                                          width:
                                                              127, // Match the container's width
                                                          height:
                                                              170, // Adjust height as needed
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
                                                      Get.toNamed('/book-read',
                                                          arguments: book);
                                                    },
                                                    child: Text(
                                                      book.title ?? 'Unknown',
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .rBackground), // Text color
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                        )),

                    SizedBox(
                      height: 66,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
