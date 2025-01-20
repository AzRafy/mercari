import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final Color textcolor;
  final dynamic btnSize;
  final dynamic textPadding;
  const CustomButton({
    super.key,
    required this.text,
    required this.bgcolor,
    required this.textcolor,
    required this.btnSize,
    this.textPadding,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          foregroundColor: textcolor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: textPadding,
          child: Text(
            text,
            style: btnSize,
          ),
        ),
      ),
    );
  }
}
