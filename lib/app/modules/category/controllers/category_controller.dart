import 'package:belajar_getx/app/data/categories_models.dart';
import 'package:belajar_getx/app/modules/category/views/category_detail_view.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class CategoryController extends GetxController {
  var category = {}.obs;
  var isLoading = true.obs;
  var name = ''.obs;

  void onNameChanged(String value) {
    name.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // var token = localStorage.getString('token');

      // if (token == null) {
      //   throw Exception('Token not found');
      // }

      // var headers = {'Authorization': 'Bearer $token'};

      var apiUrl = '/categories';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        // headers: headers,
      );
      if (response.statusCode == 200) {
        var categoryData = json.decode(response.body);
        category.assignAll(categoryData);
        if (category != null && category.isNotEmpty) {
          for (var item in category['category']) {
            var name = item['name'];
            print('Nama kategori: $name');
          }
        }
      } else {
        throw Exception('Failed to load category');
      }
    } catch (e) {
      print('Error during fetching category: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addCategory(
    String name,
  ) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categories';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': name,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'category berhasil ditambahkan');
        fetchCategories();
        Get.offAndToNamed(Routes.CATEGORY); // Redirect ke halaman pasien
      } else {
        throw Exception('Failed to add category');
      }
    } catch (e) {
      print('Error during tambah category: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  Future<void> editCategory(
    Category category,
    String name,
  ) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categories/${category.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': name,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'category berhasil diubah');
        fetchCategories(); // Refresh the pasienList
        Get.offAndToNamed(Routes.CATEGORY);
      } else {
        throw Exception('Failed to edit category');
      }
    } catch (e) {
      print('Error during edit category: $e');
    }
  }

  void showCategoryDetails(Category category) {
    Get.to(() => DetailCategoryView(category: category));
  }

  Future<void> deleteCategory(Category category) async {
    try {
      var apiUrl = '${Api.baseUrl}/categories/${category.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Category berhasil dihapus');
        fetchCategories();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete category');
      }
    } catch (e) {
      print('Error during delete category: $e');
    }
  }


}
