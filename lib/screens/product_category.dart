import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/controllers/allproducts_controller.dart';
import '../controllers/home_controller.dart';
import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/drawer.dart';
import 'product_subcategory.dart';
import 'view_products.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final HomeController homeController = Get.find();
  final AllproductsController allproductsController =
      Get.put(AllproductsController());
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    final categories = homeController.productCategoryData;

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
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (categories.isNotEmpty) {
                  final product = categories[index].image?.src;
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ViewProducts(
                          categoryId: categories[index].id.toString(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          (product != null && product.isNotEmpty)
                              ? product
                              : "$product",
                          height: isTablet ? 150 : 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        categories[index].name,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  );
                }
                return const Center(
                  child: Text('No Products Available'),
                );
              },
              itemCount: categories!.length - 1,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: ColorResources.borderColor,
                );
              },
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
