import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/widgets/collection_images.dart';
import '../controllers/allproducts_controller.dart';
import '../controllers/categorybase_product_controller.dart';
import '../models/categorybase_products_model.dart';
import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/drawer.dart';

class ViewProducts extends StatefulWidget {
  final String categoryId;
  const ViewProducts({super.key, required this.categoryId});

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  final CategorybaseProductController categoryWiseProductController =
      Get.find();
  final AllproductsController allProductsController = Get.find();

  @override
  void initState() {
    super.initState();
    categoryWiseProductController.getCategoryBaseProducts(
      int.parse(widget.categoryId),
    );
  }

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
      body: SingleChildScrollView(
        child: SizedBox(
          width: AppConstants.screenWidth,
          height:
              isTablet ? AppConstants.screenHeight : AppConstants.screenHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: GetBuilder<CategorybaseProductController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final showCategoryProducts =
                    categoryWiseProductController.categorybaseProduct;
                if (showCategoryProducts == null ||
                    showCategoryProducts.isEmpty) {
                  return GridView.builder(
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTablet ? 7 : 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: isTablet ? 0 : 0,
                    ),
                    itemCount: CollectionImages.topsAndshirts.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        CollectionImages.topsAndshirts[index]['image']
                            .toString(),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                      );
                    },
                  );
                }
                return GridView.builder(
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 7 : 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: showCategoryProducts.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        if (showCategoryProducts[index].images.isNotEmpty)
                          ...showCategoryProducts[index].images.map(
                                (image) => Image.network(
                                  image.src,
                                  width: AppConstants.screenWidth * 0.4,
                                  height: isTablet
                                      ? AppConstants.screenHeight * 0.45
                                      : AppConstants.screenHeight * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ) // Spread operator to convert Iterable into a List
                        else
                          Image.asset(
                            CollectionImages.topsAndshirts[index]['image']
                                .toString(),
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.05,
                            fit: BoxFit.cover,
                          ),
                        Positioned(
                          bottom: isTablet ? 0 : 0,
                          left: 0,
                          child: Opacity(
                            opacity: 0.85,
                            child: Container(
                              color: ColorResources.normalTextColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isTablet ? 25 : 15,
                                  vertical: isTablet ? 10 : 5,
                                ),
                                child: Text(
                                  "\$${showCategoryProducts[index].price}",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),

        // ),
      ),
    );
  }
}
