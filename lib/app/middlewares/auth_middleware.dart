import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    _isLoggedIn().then((isLoggedIn) {
      _hasToken().then((hasToken) {
        if (!isLoggedIn || !hasToken) {
          Get.offNamed('/login');   
        }
      });
    });


  } 

  Future<bool> _isLoggedIn() async {
    SharedPreferences localeStorage = await SharedPreferences.getInstance();
    String? token = localeStorage.getString('token');
    return token != null;
  }

  Future<bool> _hasToken() async {
    SharedPreferences localeStorage = await SharedPreferences.getInstance();
    String? token = localeStorage.getString('token');
    return token != null;
  }

}