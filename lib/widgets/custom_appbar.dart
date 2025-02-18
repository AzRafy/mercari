import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/cart.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import 'custom_searchbar.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return isTablet
        // for tablet
        ? SizedBox(
            width: AppConstants.screenWidth * 0.93,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Image.asset(
                  'assets/images/login_logo.png',
                  // width: AppConstants.screenWidth * 0.3,
                  // height: AppConstants.screenHeight * 0.08,
                ),
                CustomSearchbar(
                  onTextFieldChanged: (p0) {},
                  onEmailChanged: (p0) {},
                  onPasswordChanged: (p0) {},
                  onPasswordStrengthChanged: (p0, p1, p2, p3) {},
                  placeholderText: 'Search for anything',
                  icon: const Icon(Icons.search),
                  fillColor: ColorResources.appTextColor,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  onSearchChanged: (value) {},
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const Cart(),
                    );
                  },
                  child: const Icon(
                    Icons.add_shopping_cart,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.person_2_outlined,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        // for mobile
        : Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/images/login_logo.png',
                    // width: AppConstants.screenWidth * 0.3,
                    // height: AppConstants.screenHeight * 0.08,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const Cart(),
                      );
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.person_2_outlined,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomSearchbar(
                onTextFieldChanged: (p0) {},
                onEmailChanged: (p0) {},
                onPasswordChanged: (p0) {},
                onPasswordStrengthChanged: (p0, p1, p2, p3) {},
                placeholderText: 'Search for anything',
                icon: const Icon(Icons.search),
                fillColor: ColorResources.appTextColor,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                onSearchChanged: (value) {},
              ),
            ],
          );
  }
}
