import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/home_screen.dart';
import 'package:mercari_app/screens/product_category.dart';

import '../utils/color_resources.dart';
import 'custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.appButtonBGColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'List an item',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                Get.offAll(() => const HomeScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Browse Categories'),
              onTap: () {
                Get.offAll(() => const ProductCategory());
              },
            ),
          ],
        ),
      ),
    );
  }
}
