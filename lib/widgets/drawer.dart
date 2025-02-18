import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/featured_product.dart';
import 'package:mercari_app/screens/home_screen.dart';
import 'package:mercari_app/screens/login_screen.dart';
import 'package:mercari_app/screens/myorder_screen.dart';
import 'package:mercari_app/screens/product_category.dart';
import 'package:mercari_app/screens/products_screen.dart';
import 'package:mercari_app/screens/signup_screen.dart';
import 'package:mercari_app/screens/whishlist_products.dart';
import '../utils/color_resources.dart';

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
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => HomeScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: Text(
                'Products',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.to(
                  () => ProductsScreen(),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Browse Categories'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => const ProductCategory());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.star_border_purple500_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Featured'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => const FeaturedProduct());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_outline_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Whishlist'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => const WhishlistProducts());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('My Orders'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                // Get.offAll(() => const MyorderScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_2_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Sign up'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => const SignupScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.login_outlined,
                color: ColorResources.normalTextColor,
                size: 30,
              ),
              title: const Text('Log in'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.normalTextColor,
                size: 20,
              ),
              onTap: () {
                Get.offAll(() => const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
