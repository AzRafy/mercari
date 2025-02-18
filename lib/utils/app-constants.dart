// ignore: unused_import
import 'package:flutter/material.dart';

class AppConstants {
  static late double screenHeight;
  static late double screenWidth;
  static void globalWidthAndHeight(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static String consumerKey = 'ck_00fc4d11a9b3efde6d9e8a45f0e948b0280e0ec3';
  static String consumerSecret = 'cs_58cc3e1587a822eed3cdca789657a876d72acb40';
  static String appName = 'Mercari';
  static String welcomeScreenText = 'Happy Shopping';
  static String baseUrl = 'https://precisemoldtech.com';
  static String productCategories = '/wp-json/wc/v3/products/categories';
  static String categoryBaseProducts =
      '/wp-json/wc/v3/products'; // to combine with categories only
  static String allProducts = '/wp-json/wc/v3/products'; // to show all products
}
