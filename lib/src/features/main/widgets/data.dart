import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/main/widgets/category.dart'
    as Category;

class Data {
  static List<Category.Category> getMockedCategories() {
    return [
      Category.Category(
        color: Colors.blue,
        name: 'gradinarit',
        imgname: 'gardeningcat',
        icon: 'favorite',
      ),
      Category.Category(
        color: Colors.blue,
        name: 'It',
        imgname: 'ITcat',
        icon: 'computer',
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Carat',
        imgname: 'mobilacat',
        icon: 'local_shipping',
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Constructii',
        imgname: 'constructiicat',
        icon: 'build',
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Design',
        imgname: 'designcat',
        icon: 'border_color',
      ),
    ];
  }
}
