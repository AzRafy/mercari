import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/login_screen.dart';
import 'package:mercari_app/utils/color_resources.dart';
import 'package:mercari_app/widgets/custom_searchbar.dart';
import '../utils/app-constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  String _passwordStrengthText = '';
  Color _strengthColor = ColorResources.borderColor;
  double _lineWidth = 0.0;

  void _updatePasswordStrength(String helperText, String strengthText,
      Color strengthColor, double lineWidth) {
    setState(() {
      _passwordStrengthText = strengthText;
      _strengthColor = strengthColor;
      _lineWidth = lineWidth.clamp(0.0, 1.0);
    });
  }

  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  bool isButtonEnabled = false;

// This method checks if both email and password are filled to enable the button.
  void onTextFieldChanged() {
    setState(() {
      isButtonEnabled = isEmailFilled && isPasswordFilled && isChecked;
    });
  }

// This method is for handling the onChanged for email
  void onEmailChanged(bool isFilled) {
    setState(() {
      isEmailFilled = isFilled;
      onTextFieldChanged();
    });
  }

// This method is for handling the onChanged for password
  void onPasswordChanged(bool isFilled) {
    setState(() {
      isPasswordFilled = isFilled;
      onTextFieldChanged();
    });
  }

  // Method to handle checkbox state
  void onCheckboxChanged(bool value) {
    setState(() {
      isChecked = value;
      onTextFieldChanged(); // Update the button state
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = AppConstants.screenWidth > 600;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 40 : 20,
                  // vertical: 20,
                ),
                child: SizedBox(
                  width: AppConstants.screenWidth,
                  child: Center(
                    child: SizedBox(
                      width: isTablet
                          ? AppConstants.screenWidth * 0.5
                          : AppConstants.screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppConstants.screenHeight * 0.08,
                          ),
                          Image.asset(
                            'assets/images/signup_logo.png',
                            // width: AppConstants.screenWidth * 0.3,
                            // height: AppConstants.screenHeight * 0.08,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.03,
                          ),
                          Text(
                            'Sign up to continue',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          Text(
                            'To like or purchase an item, or to chat with the seller, please create your account.',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              Text(
                                'Have an invite code?',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(206, 206, 210, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.question_mark_outlined,
                                  size: 16,
                                  color: ColorResources.appTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.03,
                          ),
                          Image.asset(
                            'assets/images/welcome.png',
                            width: AppConstants.screenWidth,
                            scale: isTablet ? 0.5 : 1,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          const Divider(
                            color: ColorResources.dividerColor,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: AppConstants.screenWidth * 0.9,
                              height: AppConstants.screenHeight * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorResources.btnborderColor,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/google_logo.png',
                                    width: AppConstants.screenWidth * 0.05,
                                    height: AppConstants.screenHeight * 0.05,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Continue with Google',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: AppConstants.screenWidth * 0.9,
                              height: AppConstants.screenHeight * 0.07,
                              decoration: BoxDecoration(
                                color: ColorResources.appButtonBGColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.facebook_outlined,
                                    size: 30,
                                    color: ColorResources.appTextColor,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Continue with Facebook',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.apple_outlined,
                                    size: 34,
                                    color: ColorResources.appTextColor,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Continue with Apple',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: ColorResources.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                    color: ColorResources.paragraphColor,
                                    fontSize: isTablet
                                        ? AppConstants.screenWidth * 0.015
                                        : AppConstants.screenWidth * 0.04,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: ColorResources.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          Text(
                            'Email address',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.01,
                          ),
                          CustomSearchbar(
                            onTextFieldChanged:
                                onEmailChanged, // For email field
                            onPasswordChanged: onPasswordChanged,
                            onPasswordStrengthChanged: _updatePasswordStrength,
                            // controller: searchController,
                            placeholderText: 'Enter your email',
                            fillColor: Colors.transparent,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: ColorResources.borderColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            onSearchChanged: (value) {},
                            onEmailChanged: onEmailChanged,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.04,
                          ),
                          Text(
                            'Password',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.01,
                          ),
                          CustomSearchbar(
                            onTextFieldChanged:
                                onEmailChanged, // For email field
                            onPasswordChanged: onPasswordChanged,
                            onPasswordStrengthChanged: _updatePasswordStrength,
                            // controller: searchController,
                            obscureText: true,
                            placeholderText: 'Use at least 8 characters',
                            fillColor: Colors.transparent,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: ColorResources.borderColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            onSearchChanged: (value) {},
                            onEmailChanged: (bool) {},
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.04,
                          ),
                          Text(
                            'Password Strength: $_passwordStrengthText',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.01,
                          ),
                          // Password Strength Line
                          TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            tween: Tween<double>(begin: 0.0, end: _lineWidth),
                            builder: (context, value, child) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: (value * 10).toInt(),
                                    child: Container(
                                      height: AppConstants.screenHeight * 0.007,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: _strengthColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: (10 - (value * 10)).toInt(),
                                    child: Container(
                                      height: AppConstants.screenHeight * 0.007,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: ColorResources.borderColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                          SizedBox(
                            height: AppConstants.screenHeight * 0.03,
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  splashRadius: 0,
                                  value: isChecked,
                                  onChanged: (value) {
                                    onCheckboxChanged(
                                        value!); // Handle checkbox state change
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  activeColor: ColorResources.appButtonBGColor,
                                  side: const BorderSide(
                                      color: ColorResources.dividerColor),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: "I agree to the Mercari ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    children: [
                                      TextSpan(
                                        text: "Terms of Service",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      TextSpan(
                                        text: " and ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      TextSpan(
                                        text: ".",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: isButtonEnabled && isChecked
                                ? () {
                                    Get.to(
                                      () => const LoginScreen(),
                                    );
                                  }
                                : null,
                            child: Container(
                              width: AppConstants.screenWidth * 0.9,
                              height: AppConstants.screenHeight * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorResources.dividerColor,
                                ),
                                color: (isButtonEnabled && isChecked)
                                    ? ColorResources.appButtonBGColor
                                    : ColorResources.dividerColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign up',
                                    style: TextStyle(
                                      backgroundColor: isButtonEnabled
                                          ? ColorResources.appButtonBGColor
                                          : ColorResources.dividerColor,
                                      fontSize: 16,
                                      color: ColorResources.appTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.04,
                          ),
                          Text(
                            'We keep your information safe. We never use your information outside of Mercari.',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              Text(
                                'Already have an account?',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => const LoginScreen(),
                                  );
                                },
                                child: Text(
                                  'Log in',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppConstants.screenHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
