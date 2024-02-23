import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryCreateView extends GetView<CategoryController> {
  CategoryCreateView({Key? key}) : super(key: key);
  final TextEditingController namaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateCategoryView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Add Category',
              style: TextStyle(fontSize: 20),
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                TextFormField(
                  onChanged: controller.onNameChanged,
                  controller: namaController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Input Name';
                    }
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    controller.addCategory(namaController.text);
                  },
                  child: Text('Add'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
