import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hope_bible/commonmodule/AppColor.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mPrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.mPrimary),
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: AppColor.mPrimary,
          ),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.menu,
        //         color: AppColor.mPrimary,
        //       ))
        // ],
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/photos/contactus_logo.png'),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Left and right padding
                    child: Container(
                      width: double.infinity,
                      height: 210,
                      decoration: BoxDecoration(
                        color: AppColor.mBackground.withAlpha(50),
                        borderRadius:
                            BorderRadius.circular(16.0), // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'If you need any question, you can call us anytime.',
                                style: TextStyle(
                                  color: AppColor.rBackground,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone:  ${controller.contactData.value?.phone1 ?? ''} | ${controller.contactData.value?.phone2 ?? ''}',
                                    style: TextStyle(
                                      color: AppColor.rBackground,
                                    ),
                                  ),
                                  Text(
                                    'Email: ${controller.contactData.value?.email ?? ''}',
                                    style: TextStyle(
                                      color: AppColor.rBackground,
                                    ),
                                  ),
                                  Text(
                                    'Address: ${controller.contactData.value?.address ?? ''}',
                                    style: TextStyle(
                                      color: AppColor.rBackground,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Using Facebook icon
                                  IconButton(
                                    onPressed: () {
                                      controller.goToWebsite(controller
                                              .contactData.value?.facebook ??
                                          '');
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                    ),
                                  ),

// Using Messenger icon
                                  IconButton(
                                    onPressed: () {
                                      controller.goToWebsite(controller
                                              .contactData.value?.messenger ??
                                          '');
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.facebookMessenger,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
