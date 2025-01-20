import 'package:flutter/material.dart';

import '../utils/color_resources.dart';

class CustomSearchbar extends StatelessWidget {
  final dynamic placeholderText;
  final dynamic icon;
  final dynamic fillColor;
  final dynamic border;
  const CustomSearchbar(
      {super.key,
      this.placeholderText,
      this.icon,
      this.fillColor,
      this.border});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return SizedBox(
      width: isTablet
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholderText,
          hintStyle: Theme.of(context).textTheme.titleMedium,
          suffixIcon: icon,
          fillColor: fillColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          filled: true,
          border: border,
        ),
      ),
    );
  }
}
