import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/signup_screen.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';

class LoginScreen extends StatefulWidget {
  final bool obscureText;
  final dynamic icon;
  const LoginScreen({
    super.key,
    this.obscureText = false,
    this.icon,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = AppConstants.screenWidth > 600;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 40 : 20,
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
                          'Log in to Mercari',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: AppConstants.screenHeight * 0.03,
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
                                  style: Theme.of(context).textTheme.labelSmall,
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
                                  style: Theme.of(context).textTheme.labelSmall,
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
                        TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorResources.appButtonBGColor,
                                width: AppConstants.screenWidth * 0.002,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorResources.paragraphColor),
                            ),
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
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
                        TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorResources.appButtonBGColor,
                                width: AppConstants.screenWidth * 0.002,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorResources.paragraphColor),
                            ),
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.screenHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
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
                                color: ColorResources.dividerColor,
                              ),
                              color: ColorResources.appButtonBGColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Log in',
                                  style: TextStyle(
                                    backgroundColor:
                                        ColorResources.appButtonBGColor,
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
                          'This site is protected by reCAPTCHA Enterprise and the Google Privacy Policy and Terms of Service apply.',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: AppConstants.screenHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const SignupScreen(),
                                );
                              },
                              child: Text(
                                'Sign up',
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
    ));
  }
}
