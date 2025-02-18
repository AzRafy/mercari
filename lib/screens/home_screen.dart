import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercari_app/models/list_all_products_model.dart';
import 'package:mercari_app/screens/items_detail.dart';
import 'package:mercari_app/screens/see_all_products.dart';
import 'package:mercari_app/screens/view_products.dart';
import 'package:mercari_app/utils/app-constants.dart';
import 'package:mercari_app/widgets/collection_images.dart';
import 'package:mercari_app/widgets/custom_appbar.dart';
import '../controllers/allproducts_controller.dart';
import '../controllers/categorybase_product_controller.dart';
import '../controllers/home_controller.dart';
import '../models/productcategories_model.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController =
      Get.put(HomeController()); // Category Product controller
  final categoryWiseProductController = Get.put(
      CategorybaseProductController()); // products on the specific category
  final allProductsController =
      Get.put(AllproductsController()); // all products

  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    allProductsController.getAllProducts();
    homeController.getProductsData();
  }

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
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = AppConstants.screenWidth > 600;
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: isTablet
                              ? MediaQuery.of(context).size.height * 0.24
                              : MediaQuery.of(context).size.height * 0.16,
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.9
                              : MediaQuery.of(context).size.width,
                          child:
                              GetBuilder<HomeController>(builder: (controller) {
                            final categories =
                                homeController.productCategoryData;
                            print(categories);
                            if (categories != null && categories.isNotEmpty) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: isTablet ? 0 : 16,
                                ),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length - 1,
                                  itemBuilder: (context, index) {
                                    final showCategories =
                                        categories[index].image?.src;
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ViewProducts(
                                            categoryId:
                                                categories[index].id.toString(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(100),
                                                ),
                                              ),
                                              child: Image.network(
                                                (showCategories != null &&
                                                        showCategories
                                                            .isNotEmpty)
                                                    ? showCategories
                                                    : "",
                                                width: isTablet
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.085
                                                    : AppConstants.screenWidth *
                                                        0.14,
                                                // height: isTablet
                                                //     ? 150
                                                //     : AppConstants
                                                //             .screenHeight *
                                                //         0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              categories[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                    Container(
                      width: AppConstants.screenWidth * 0.92,
                      height: isTablet
                          ? AppConstants.screenHeight * 0.5 //for tablet
                          : 200, // for mobile
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hero_bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: isTablet ? 80 : 40,
                            top: isTablet ? 80 : 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ColorResources.appTextBGColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 4,
                                ),
                                child: Text(
                                  'Mercari x Japan',
                                  style: isTablet
                                      ? TextStyle(
                                          fontSize: 70,
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              GoogleFonts.poppins().toString(),
                                          color: ColorResources.appTextColor,
                                        )
                                      : Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: isTablet ? 130 : 40,
                            top: isTablet ? 200 : 85,
                            child: Text(
                              maxLines: 2,
                              isTablet
                                  ? "Discover millions of new listings from Japan's top brands"
                                  : "Discover millions of new listings from\nJapan's top brands",
                              style: isTablet
                                  ? TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:
                                          GoogleFonts.poppins().toString(),
                                      color: ColorResources.appTextColor,
                                    )
                                  : Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          Positioned(
                            left: isTablet ? 130 : 40,
                            top: isTablet ? 240 : 125,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    ColorResources.appButtonBGColor,
                                foregroundColor: ColorResources.appTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(
                                    width: 1,
                                    color: ColorResources.appTextColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: isTablet
                                    ? const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 15,
                                      )
                                    : const EdgeInsets.all(0),
                                child: Text(
                                  'Shop the drop',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isTablet ? 0 : 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: isTablet ? 37 : 8),
                      child: AspectRatio(
                        aspectRatio: isTablet ? 20 / 4 : 16 / 9,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CollectionImages.imageSlide.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: isTablet
                                  ? AppConstants.screenWidth * 0.294
                                  : AppConstants.screenWidth * 0.75,
                              margin: EdgeInsets.symmetric(
                                horizontal: isTablet
                                    ? AppConstants.screenWidth * 0.01
                                    : AppConstants.screenWidth * 0.02,
                                vertical: isTablet ? 20 : 8,
                              ),
                              child: Image.asset(
                                CollectionImages.imageSlide[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: isTablet ? 0 : 10,
                    ),
                    SizedBox(
                      width: isTablet
                          ? AppConstants.screenWidth * 0.92
                          : AppConstants.screenWidth * 0.93,
                      height: isTablet
                          ? AppConstants.screenHeight * 0.391
                          : AppConstants.screenHeight * 0.42,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 4 : 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: isTablet ? 0 : 20,
                        ),
                        itemCount: CollectionImages.gridCard.length,
                        itemBuilder: (context, index) {
                          return Image.asset(CollectionImages.gridCard[index]);
                        },
                      ),
                    ),
                    SizedBox(
                      height: isTablet ? 0 : 5,
                    ),
                    SizedBox(
                      height: isTablet
                          ? AppConstants.screenHeight * 0.63
                          : AppConstants.screenHeight * 0.42,
                      width: isTablet
                          ? AppConstants.screenWidth * 0.934
                          : AppConstants.screenWidth,
                      child: ListView.builder(
                        itemCount: CollectionImages.imageItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: isTablet
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      )
                                    : const EdgeInsets.only(
                                        left: 14,
                                        top: 8,
                                      ),
                                child: Image.asset(
                                  CollectionImages.imageItems[index],
                                  width: isTablet
                                      ? AppConstants.screenWidth * 0.2958
                                      : 250,
                                  // height: isTablet ? 500 : 370,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.85
                          : 390,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.934
                          : MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: CollectionImages.fitnessGallery.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: isTablet
                                ? const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  )
                                : const EdgeInsets.only(
                                    left: 14,
                                    top: 8,
                                  ),
                            child: AspectRatio(
                              aspectRatio: 2.3 / 4,
                              child: Image.asset(
                                CollectionImages.fitnessGallery[index],
                                // width: isTablet
                                //     ? MediaQuery.of(context).size.width * 0.26
                                //     : 200,
                                height: isTablet ? 600 : 370,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: isTablet ? 30 : 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: isTablet
                              ? const EdgeInsets.only(
                                  left: 75,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            'Top Categories',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: isTablet
                              ? MediaQuery.of(context).size.height * 0.27
                              : MediaQuery.of(context).size.height * 0.2,
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.9
                              : MediaQuery.of(context).size.width,
                          child:
                              GetBuilder<HomeController>(builder: (controller) {
                            final categories =
                                homeController.productCategoryData;
                            print(categories);
                            if (categories != null && categories.isNotEmpty) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: isTablet ? 0 : 16,
                                ),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length - 1,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ViewProducts(
                                            categoryId:
                                                categories[index].id.toString(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              // color: ColorResources.appStatusBarColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: isTablet ? 10 : 5,
                                              ),
                                              child: ClipOval(
                                                child: Image.network(
                                                  (categories[index]
                                                                  .image
                                                                  ?.src !=
                                                              null &&
                                                          categories[index]
                                                              .image!
                                                              .src
                                                              .isNotEmpty)
                                                      ? categories[index]
                                                          .image!
                                                          .src
                                                      : "",
                                                  width: isTablet
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.12
                                                      : 105,
                                                  height: isTablet ? 150 : 105,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            categories[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(
                                  child: Text('No Data Available'));
                            }
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "See what's selling",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: isTablet ? 0 : 20,
                          ),
                          child: GetBuilder<AllproductsController>(
                            builder: (controller) {
                              final displayImages = controller.listOfProducts;
                              return GestureDetector(
                                onTap: () {
                                  // showing dummy images at the moment because of not having api images
                                  if (displayImages != null &&
                                      displayImages.isNotEmpty) {
                                    Get.to(
                                      () => SeeAllProducts(
                                        products: displayImages.isNotEmpty
                                            ? displayImages
                                            : [],
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "See all",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? AppConstants.screenHeight * 0.25
                          : AppConstants.screenHeight * 0.2,
                      width: isTablet
                          ? AppConstants.screenWidth * 0.9
                          : AppConstants.screenWidth * 0.92,
                      child: GetBuilder<AllproductsController>(
                          builder: (controller) {
                        if (controller.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final seeAllproducts =
                            allProductsController.listOfProducts;
                        // print("All products are showing? $seeAllproducts");
                        if (seeAllproducts != null && seeAllproducts.isEmpty) {
                          return ListView.builder(
                            itemCount: seeAllproducts.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final products = seeAllproducts[index];
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Image.network(
                                      products.images[index].src,
                                      width: isTablet
                                          ? AppConstants.screenWidth * 0.15
                                          : 120,
                                      height: isTablet ? 150 : 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: isTablet ? 115 : 94,
                                    left: 4,
                                    child: Container(
                                      color: ColorResources.normalTextColor,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isTablet ? 25 : 15,
                                          vertical: isTablet ? 10 : 5,
                                        ),
                                        child: Text(
                                          "\$${CollectionImages.products[index]["price"].toString()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    child: Container(
                                      color: ColorResources.normalTextColor,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isTablet ? 20 : 10,
                                          vertical: isTablet ? 10 : 5,
                                        ),
                                        child: Text(
                                          CollectionImages.products[index]
                                                  ['status']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return ListView.builder(
                          itemCount: CollectionImages.topsAndshirts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  child: Image.asset(
                                    CollectionImages.topsAndshirts[index]
                                            ['image']
                                        .toString(),
                                    width: isTablet
                                        ? MediaQuery.of(context).size.width *
                                            0.15
                                        : 120,
                                    height: isTablet ? 150 : 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: isTablet ? 115 : 94,
                                  left: 4,
                                  child: Container(
                                    color: ColorResources.normalTextColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isTablet ? 25 : 15,
                                        vertical: isTablet ? 10 : 5,
                                      ),
                                      child: Text(
                                        "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ),
                    SizedBox(
                      height: isTablet
                          ? AppConstants.screenHeight * 0.25
                          : AppConstants.screenHeight * 0.24,
                      width: isTablet
                          ? AppConstants.screenWidth * 0.9
                          : AppConstants.screenWidth * 0.9,
                      child: isTablet
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Say hello to your new favorite thing.',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  'assets/images/game_bot.jpg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              ],
                            )
                          : Wrap(
                              runSpacing: 5,
                              spacing: 10,
                              children: [
                                Text(
                                  'Say hello to your new favorite thing.',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  'assets/images/game_bot.jpg',
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Tops & t-shirts",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: isTablet ? 0 : 20,
                          ),
                          child: GetBuilder<HomeController>(
                            builder: (controller) {
                              return GestureDetector(
                                onTap: () {
                                  if (controller.productCategoryData != null &&
                                      controller
                                          .productCategoryData!.isNotEmpty) {
                                    print(
                                        "Navigating to SeeAllProducts with data: ${controller.productCategoryData}");
                                    // Get.to(
                                    //   () => SeeAllProducts(
                                    //     productId: controller.productCategoryData!.first.id.toString(),
                                    //   ),
                                    // );
                                  } else {
                                    print("No products available");
                                  }
                                },
                                child: Text(
                                  "See all",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 130,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: GetBuilder<HomeController>(
                        builder: (controller) {
                          // if (controller.isLoading) {
                          //   return const Center(
                          //       child: CircularProgressIndicator());
                          // }
                          final categories = homeController.productCategoryData;
                          if (categories != null && categories.isNotEmpty) {
                            return ListView.builder(
                              itemCount: categories.length - 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      child: Image.network(
                                        (categories[index].image?.src != null &&
                                                categories[index]
                                                    .image!
                                                    .src
                                                    .isNotEmpty)
                                            ? categories[index].image!.src
                                            : "${categories[index].image?.src}",
                                        width: isTablet
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15
                                            : 120,
                                        height: isTablet ? 150 : 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: isTablet ? 115 : 94,
                                      left: 4,
                                      child: Container(
                                        color: ColorResources.normalTextColor,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: isTablet ? 25 : 15,
                                            vertical: isTablet ? 10 : 5,
                                          ),
                                          child: Text(
                                            "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text('No Data Available'));
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Athletic apparel",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Shoes",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Collectibles",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: isTablet
                              ? Text(
                                  "Stuffed animals & plush toys",
                                  style: Theme.of(context).textTheme.labelLarge,
                                )
                              : Wrap(
                                  children: [
                                    Text(
                                      "Stuffed animals & plush toys",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    )
                                  ],
                                ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Video games & consoles",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: isTablet
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: isTablet
                              ? EdgeInsets.only(
                                  left: 70,
                                  right: isTablet ? 20 : 0,
                                )
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: Text(
                            "Seasonal decor",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: isTablet ? 0 : 20,
                            ),
                            child: Text(
                              "See all",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: isTablet
                          ? MediaQuery.of(context).size.height * 0.25
                          : 150,
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.92,
                      child: ListView.builder(
                        itemCount: CollectionImages.topsAndshirts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Image.asset(
                                  CollectionImages.topsAndshirts[index]['image']
                                      .toString(),
                                  width: isTablet
                                      ? MediaQuery.of(context).size.width * 0.15
                                      : 120,
                                  height: isTablet ? 150 : 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: isTablet ? 115 : 94,
                                left: 4,
                                child: Container(
                                  color: ColorResources.normalTextColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 25 : 15,
                                      vertical: isTablet ? 10 : 5,
                                    ),
                                    child: Text(
                                      "\$${CollectionImages.topsAndshirts[index]["price"].toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
