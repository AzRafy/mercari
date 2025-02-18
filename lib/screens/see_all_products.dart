import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercari_app/models/list_all_products_model.dart';
import 'package:mercari_app/screens/items_detail.dart';
import 'package:mercari_app/widgets/collection_images.dart';
import '../controllers/allproducts_controller.dart';
import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer.dart';

class SeeAllProducts extends StatefulWidget {
  final List<ListAllProduct> products;
  // bool isPlaceholder;
  const SeeAllProducts({
    super.key,
    required this.products,
    // this.isPlaceholder = false,
  });

  @override
  State<SeeAllProducts> createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  final AllproductsController allProductsController = Get.find();

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<AllproductsController>(
            builder: (controller) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final productShowcase = widget.products;
              // if (productShowcase.isEmpty) {
              //   return GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: isTablet ? 4 : 3,
              //       crossAxisSpacing: 5,
              //       mainAxisSpacing: 5,
              //     ),
              //     itemCount: CollectionImages.topsAndshirts.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Image.asset(
              //           CollectionImages.topsAndshirts[index]['image']
              //               .toString(),
              //           width: 120,
              //           height: 120,
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     },
              //   );
              // }
              return SizedBox(
                width: double.infinity,
                height: AppConstants.screenHeight,
                child: GridView.builder(
                  shrinkWrap: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 7 : 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: productShowcase.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        if (productShowcase[index].images.isNotEmpty)
                          // ...productShowcase[index].images.map(
                          //       (image) =>
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ItemsDetail(
                                  productId: productShowcase[index]
                                      .images[index]
                                      .id
                                      .toString(),
                                ),
                              );
                            },
                            child: Image.network(
                              productShowcase[index].images.first.src,
                              width: AppConstants.screenWidth * 0.4,
                              height: isTablet
                                  ? AppConstants.screenHeight * 0.45
                                  : AppConstants.screenHeight * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        // ) // Spread operator to convert Iterable into a List
                        // else
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ItemsDetail(
                                productId: productShowcase[index]
                                    .images[index]
                                    .id
                                    .toString(),
                              ),
                            );
                          },
                          child: Image.asset(
                            CollectionImages.topsAndshirts[index]['image']
                                .toString(),
                            width: AppConstants.screenWidth * 0.3,
                            height: AppConstants.screenHeight * 0.4,
                            fit: BoxFit.cover,
                          ),
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
                                  "\$${productShowcase[index].price}",
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
