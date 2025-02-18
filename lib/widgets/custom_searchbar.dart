import 'package:flutter/material.dart';
import 'package:mercari_app/utils/app-constants.dart';
import 'package:mercari_app/utils/color_resources.dart';

class CustomSearchbar extends StatefulWidget {
  final dynamic placeholderText;
  final dynamic controller;
  final dynamic icon;
  final dynamic fillColor;
  final dynamic border;
  final bool obscureText;
  final Function(String) onSearchChanged;
  final Function(String, String, Color, double) onPasswordStrengthChanged;
  final Function(bool) onTextFieldChanged;
  final Function(bool) onEmailChanged;
  final Function(bool) onPasswordChanged;

  const CustomSearchbar({
    super.key,
    this.placeholderText,
    this.icon,
    this.fillColor,
    this.border,
    required this.onSearchChanged,
    this.controller,
    this.obscureText = false,
    required this.onPasswordStrengthChanged,
    required this.onTextFieldChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  TextEditingController userController = TextEditingController();
  late bool _obscureText;
  String? emailError;
  String? passwordError;
  String passwordStrengthText = '';
  String helperText = '';
  Color strengthColor = ColorResources.borderColor;
  double lineWidth = 0.0;

  // to check the field is focused or not
  FocusNode focusNode = FocusNode();
  Color borderColor = ColorResources.borderColor;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          borderColor = focusNode.hasFocus
              ? ColorResources.appButtonBGColor
              : ColorResources.borderColor;
        });
        print('Textfield is focused');
      } else {
        print('focus is lost');
      }
    });
  }

  void checkTextField() {
    widget.onTextFieldChanged(userController.text.isNotEmpty); // Notify parent
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return SizedBox(
      width:
          isTablet ? AppConstants.screenWidth * 0.6 : AppConstants.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            focusNode: focusNode,
            controller: userController,
            obscureText: _obscureText,
            onChanged: (value) {
              setState(() {
                if (!widget.obscureText) {
                  emailError = isValidEmail(value)
                      ? null
                      : "Please enter a valid email address";
                  widget.onEmailChanged(value.isNotEmpty);
                } else {
                  if (value.isEmpty) {
                    passwordStrengthText = '';
                    strengthColor = Colors.grey;
                    lineWidth = 0.0;
                  } else if (value.length < 8) {
                    passwordStrengthText = 'Weak';
                    strengthColor = Colors.red;
                    lineWidth = 0.4;
                    passwordError = 'Create a strong password';
                  } else if (value.length == 8) {
                    passwordStrengthText = 'Moderate';
                    strengthColor = Colors.orange;
                    lineWidth = 0.7;
                    passwordError = 'Your password looks good.';
                  } else {
                    passwordStrengthText = 'Strong';
                    strengthColor = Colors.blue;
                    lineWidth = 1.0;
                    passwordError = 'Nice! Your password looks good.';
                  }
                  widget.onPasswordChanged(value.isNotEmpty);
                }
              });
              widget.onPasswordStrengthChanged(
                  '', passwordStrengthText, strengthColor, lineWidth);
              widget.onSearchChanged(userController.text.isNotEmpty.toString());
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorResources.appButtonBGColor,
                  width: AppConstants.screenWidth * 0.002,
                ),
              ),
              errorText: passwordError,
              hintText:
                  helperText.isEmpty ? widget.placeholderText : helperText,
              hintStyle: Theme.of(context).textTheme.titleMedium,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : widget.icon,
              fillColor: widget.fillColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              filled: true,
              border: widget.border,
            ),
          ),
        ],
      ),
    );
  }
}

// Email validation
bool isValidEmail(String email) {
  return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email);
}

// Password validation
bool isValidPassword(String value) {
  return value.length >= 8;
}
