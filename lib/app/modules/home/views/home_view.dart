import 'package:belajar_getx/app/modules/category/views/category_view.dart';
import 'package:belajar_getx/app/modules/counter/views/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';
import 'package:belajar_getx/app/middlewares/auth_middleware.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SizedBox(height: 10),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GNav(
                              // tab button hover color
                              haptic: true, // haptic feedback
                              tabBorderRadius: 15,
                              tabActiveBorder: Border.all(
                                  color: Colors.black,
                                  width: 1), // tab button border
                              tabBorder: Border.all(
                                  color: Colors.grey,
                                  width: 1), // tab button border
                              tabShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 8)
                              ], // tab button shadow
                              curve: Curves.easeOutExpo, // tab animation curves
                              duration: Duration(
                                  milliseconds: 600), // tab animation duration
                              gap:
                                  16, // the tab button gap between icon and text
                              color: Colors.grey[800], // unselected icon color
                              activeColor:
                                  Colors.blue, // selected icon and text color
                              iconSize: 24, // tab button icon size
                              tabBackgroundColor: Colors.blue.withOpacity(
                                  0.1), // selected tab background color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10), // navigation bar padding
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              tabs: [
                                GButton(
                                  icon: Icons.home,
                                  text: 'Home',
                                  onPressed: () => Get.toNamed('/home'),
                                ),
                                GButton(
                                  icon: Icons.menu,
                                  text: 'Counter',
                                  onPressed: () => Get.toNamed('/counter'),
                                ),
                                GButton(
                                  icon: Icons.menu,
                                  text: 'Category',
                                  onPressed: () => Get.to(CategoryView()),
                                ),
                                GButton(
                                    icon: Icons.supervised_user_circle,
                                    text: 'Profile',
                                    onPressed: () => Get.toNamed('/profile')),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
