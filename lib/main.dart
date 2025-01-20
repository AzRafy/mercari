import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/items_detail.dart';
import 'screens/product_category.dart';
import 'utils/color_resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: ColorResources.appTextColor,
            size: 34,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            displaySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            displayMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ColorResources.appButtonBGColor,
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorResources.appPrimaryColor,
            ),
            labelSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorResources.appPrimaryColor,
            ),
            displayLarge: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorResources.appTextColor,
              backgroundColor: ColorResources.normalTextColor,
            ),
            labelMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorResources.appPrimaryColor,
            ),
            labelLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ColorResources.normalTextColor,
            ),
            headlineLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: ColorResources.normalTextColor,
            ),
            headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorResources.paragraphColor,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
