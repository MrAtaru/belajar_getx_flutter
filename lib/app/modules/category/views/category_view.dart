import 'package:belajar_getx/app/data/categories_models.dart';
import 'package:belajar_getx/app/modules/category/views/category_create_view.dart';
import 'package:belajar_getx/app/modules/category/views/category_detail_view.dart';
import 'package:belajar_getx/app/modules/category/views/category_update_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({Key? key}) : super(key: key);
  @override
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            padding: EdgeInsets.all(16),
            onPressed: () {
              Get.to(CategoryCreateView());
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: controller.category['category'].length,
                  itemBuilder: (context, index) {
                    var category = controller.category['category'][index];
                    var categoryName = category['name'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nama kategori: $categoryName',
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => CategoryUpdateView(
                                            category: Category.fromJson(
                                                category), // Convert map to Category object
                                          ));
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => DetailCategoryView(
                                            category:
                                                Category.fromJson(category),
                                          ));
                                    },
                                    child: Icon(Icons.visibility),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDeleteConfirmation(context, category);
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(), // Optional: Add a divider between categories
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }

  void showDeleteConfirmation(
      BuildContext context, Map<String, dynamic> category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Category'),
          content: Text('Are you sure you want to delete ${category['name']}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Create a Category object with necessary information
                var categoryObject = Category(
                  id: category['id'],
                  name: category['name'],
                );

                // Call the deleteCategory method from the controller
                controller.deleteCategory(categoryObject);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
