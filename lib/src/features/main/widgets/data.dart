import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omda_frontend/src/features/main/widgets/category.dart'
    as Category;

class Data {
  static List<Category.Category> getMockedCategories() {
    return [
      Category.Category(
        color: Colors.blue,
        name: 'Grădinărit',
        imgname: 'gardeningcat',
        icon: Icons.beach_access_rounded,
      ),
      Category.Category(
        color: Colors.blue,
        name: 'IT',
        imgname: 'ITcat',
        icon: Icons.admin_panel_settings_rounded,
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Cărat',
        imgname: 'mobilacat',
        icon: Icons.back_hand_rounded,
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Construcții',
        imgname: 'constructiicat',
        icon: Icons.add_home,
      ),
      Category.Category(
        color: Colors.blue,
        name: 'Design',
        imgname: 'designcat',
        icon: Icons.auto_awesome_rounded,
      ),
    ];
  }
}
