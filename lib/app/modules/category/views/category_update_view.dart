import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:belajar_getx/app/data/categories_models.dart';
import '../controllers/category_controller.dart';

class CategoryUpdateView extends StatelessWidget {
  final Category category;
  final CategoryController controller = Get.find();
  final TextEditingController namaController = TextEditingController();

  CategoryUpdateView({required this.category}) {
    namaController.text = category.name!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryUpdateView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'CategoryUpdateView',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_validateInput()) {
                        // Always call the editPasien method without any conditional checks
                        controller.editCategory(
                          category,
                          namaController.text,
                        );
                      }
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (namaController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
