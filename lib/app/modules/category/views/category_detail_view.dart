// detail_pasien_view.dart
import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/categories_models.dart';

class DetailCategoryView extends StatelessWidget {
  final Category category;

  DetailCategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${category.name}'),
          ],
        ),
      ),
    );
  }
}
