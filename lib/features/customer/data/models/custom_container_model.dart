import 'package:flutter/material.dart';

class CustomContainerModel {
  final String title;
  final String value;
  final String trendText;
  final IconData? titleIcon;

  const CustomContainerModel({
    required this.title,
    required this.value,
    required this.trendText,
    this.titleIcon,
  });
}
