import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          centerTitle: true,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.toNamed('/home'),
                        icon: Icon(Icons.arrow_back),
                        padding: EdgeInsets.only(right: 20, left: 20),
                      ),
                      IconButton(
                          onPressed: () => controller.logout(),
                          icon: Icon(Icons.logout))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Nama: ${controller.user['name']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: ${controller.user['email']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )));
  }
}
