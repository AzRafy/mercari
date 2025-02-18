import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  });

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 904;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 904;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
