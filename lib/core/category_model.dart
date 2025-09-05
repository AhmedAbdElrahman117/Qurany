import 'package:flutter/material.dart';

class CategoryModel {
  final Widget option;
  final String title;
  final IconData icon;

  const CategoryModel({
    required this.option,
    required this.title,
    required this.icon,
  });
}
