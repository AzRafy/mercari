import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/controllers/allproducts_controller.dart';
import 'package:mercari_app/controllers/categorybase_product_controller.dart';
import 'package:mercari_app/controllers/home_controller.dart';
import 'package:mercari_app/screens/items_detail.dart';
import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategorybaseProductController>();
  var selectedCategoryId = 0.obs; // Selected category ID

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.appPrimaryColor,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          toolbarHeight: isTablet
              ? AppConstants.screenHeight * 0.12
              : AppConstants.screenHeight * 0.16,
          backgroundColor: ColorResources.appBarColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const CustomAppbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // **Category List**
              SizedBox(
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.12
                    : MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width,
                child: GetBuilder<HomeController>(builder: (controller) {
                  final categories = controller.productCategoryData;
                  if (categories != null && categories.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(left: isTablet ? 75 : 16),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                int categoryId = categories[index].id;
                                selectedCategoryId.value =
                                    categoryId; // Update selected ID
                                categoryController
                                    .getCategoryBaseProducts(categoryId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: (selectedCategoryId.value ==
                                                categories[index].id)
                                            ? ColorResources.appButtonBGColor
                                            : ColorResources.appStatusBarColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                      ),
                                      child: Text(
                                        categories[index].name,
                                        style: (selectedCategoryId.value ==
                                                categories[index].id)
                                            ? const TextStyle(
                                                color: ColorResources
                                                    .appPrimaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)
                                            : Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),

              const Divider(
                height: 5,
                color: ColorResources.appStatusBarColor,
                thickness: 10,
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: AppConstants.screenHeight,
                ),
                child: Obx(() {
                  if (categoryController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final allProducts = categoryController.categorybaseProduct;
                  final filteredProducts = allProducts!
                      .where((product) => product.categories
                          .any((cat) => cat.id == selectedCategoryId.value))
                      .toList();

                  if (filteredProducts.isEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const ItemsDetail(productId: ''),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isTablet ? 7 : 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: isTablet ? 25 : 15,
                            childAspectRatio: isTablet ? 0.8 : 0.75,
                          ),
                          itemCount: CollectionImages.topsAndshirts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 0,
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                    // color: Colors.grey,
                                    ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: Image.asset(
                                              CollectionImages
                                                  .topsAndshirts[index]['image']
                                                  .toString(),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                          const Positioned(
                                            top: 5,
                                            right: 5,
                                            child: Icon(
                                              Icons.favorite,
                                              color:
                                                  ColorResources.paragraphColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'product name',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    const Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        SizedBox(width: 5),
                                        Text('reviews',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                            '\$${CollectionImages.topsAndshirts[index]['price'].toString()}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '\$${400}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '70 % OFF',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 7 : 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Get.to(
                            //   () => const ItemsDetail(productId: ''),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 0,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                  // color: Colors.grey,
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        filteredProducts[index]
                                                .images
                                                .isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                  filteredProducts[index]
                                                      .images
                                                      .first
                                                      .src,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                              )
                                            : Image.asset(
                                                CollectionImages
                                                    .topsAndshirts[index]
                                                        ['image']
                                                    .toString(), // Placeholder
                                                width:
                                                    AppConstants.screenWidth *
                                                        0.3,
                                                height:
                                                    AppConstants.screenHeight *
                                                        0.4,
                                                fit: BoxFit.cover,
                                              ),
                                        const Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Icon(
                                            Icons.favorite,
                                            color:
                                                ColorResources.paragraphColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'product name',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      SizedBox(width: 5),
                                      Text('reviews',
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                          '\$${CollectionImages.topsAndshirts[index]['price'].toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 5),
                                      const Text(
                                        '\$${400}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        '70 % OFF',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
