import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/screens/product_category.dart';
import 'package:mercari_app/widgets/collection_images.dart';
import 'package:mercari_app/widgets/drawer.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_searchbar.dart';

class ProductSubcategory extends StatelessWidget {
  const ProductSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: isTablet
            ? AppConstants.screenHeight * 0.1
            : AppConstants.screenHeight * 0.16,
        backgroundColor: ColorResources.appBarColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomAppbar(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          () => const ProductCategory(),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                    Text(
                      'Women',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                const Text(
                  'View all',
                  style: TextStyle(
                    color: ColorResources.appButtonBGColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        CollectionImages.productCategory[index]['image']
                            .toString(),
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(CollectionImages.productCategory[index]['title']
                        .toString()),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  );
                },
                itemCount: CollectionImages.productCategory.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: ColorResources.borderColor,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
