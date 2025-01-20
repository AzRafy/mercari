import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercari_app/widgets/collection_images.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/drawer.dart';
import 'items_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: ColorResources.appPrimaryColor,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: isTablet ? 110 : 100,
        backgroundColor: ColorResources.appBarColor,
        centerTitle: true,
        title: const CustomSearchbar(
          placeholderText: 'Search for anything',
          icon: Icon(Icons.search),
          fillColor: ColorResources.appTextColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: isTablet
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width * 0.95,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: CollectionImages.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                CollectionImages.items[index]['image']
                                    .toString(),
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                CollectionImages.items[index]['label']
                                    .toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.5 //for tablet
                    : 200, // for mobile
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hero_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Image.asset(
                    //   'assets/images/hero_bg.jpg',
                    //   fit: BoxFit.contain,
                    //   width: double.infinity,
                    //   height: 220,
                    // ),
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
                                fontFamily: GoogleFonts.poppins().toString(),
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
                          backgroundColor: ColorResources.appButtonBGColor,
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
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isTablet ? 300 : 240,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                  itemCount: CollectionImages.imageSlide.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: Image.asset(
                            CollectionImages.imageSlide[index],
                            width: isTablet
                                ? MediaQuery.of(context).size.width * 0.3
                                : 300,
                            height: isTablet ? 250 : 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.4
                    : MediaQuery.of(context).size.height * 0.46,
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
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.65 : 320,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.92
                    : MediaQuery.of(context).size.width * 0.95,
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
                              : const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                          child: Image.asset(
                            CollectionImages.imageItems[index],
                            width: isTablet
                                ? MediaQuery.of(context).size.width * 0.3
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
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.85 : 390,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.92
                    : MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                  itemCount: CollectionImages.fitnessGallery.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Image.asset(
                            CollectionImages.fitnessGallery[index],
                            width: isTablet
                                ? MediaQuery.of(context).size.width * 0.26
                                : 200,
                            height: isTablet ? 600 : 370,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
                      'Top brands',
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
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.25,
                    width: isTablet
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width * 0.95,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: CollectionImages.brandItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 20 : 10,
                            horizontal: isTablet ? 5 : 3,
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: ColorResources.appStatusBarColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: Image.asset(
                                  CollectionImages.brandItems[index]['image']
                                      .toString(),
                                  width: isTablet ? 140 : 120,
                                  height: isTablet ? 140 : 120,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                CollectionImages.brandItems[index]['label']
                                    .toString(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.products.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.products.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Image.asset(
                            CollectionImages.products[index]['image']
                                .toString(),
                            width: isTablet
                                ? MediaQuery.of(context).size.width * 0.15
                                : 120,
                            height: isTablet ? 150 : 120,
                            fit: BoxFit.cover,
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
                                CollectionImages.products[index]['status']
                                    .toString(),
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 250,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.9,
                child: isTablet
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Say hello to your new favorite thing.',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/game_bot.jpg',
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      )
                    : Wrap(
                        runSpacing: 5,
                        spacing: 10,
                        children: [
                          Text(
                            'Say hello to your \nnew favorite\nthing.',
                            style: Theme.of(context).textTheme.headlineLarge,
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
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          () => const ItemsDetail(),
                        );
                      },
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        Get.offAll(
                          () => const ItemsDetail(),
                        );
                      },
                      child: Stack(
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
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
                              right: isTablet ? 20 : 0,
                            )
                          : const EdgeInsets.only(
                              left: 20,
                            ),
                      child: Text(
                        isTablet
                            ? "Stuffed animals & plush toys"
                            : "Stuffed animals & plush\ntoys",
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
                              right: isTablet ? 20 : 0,
                            )
                          : const EdgeInsets.only(
                              left: 20,
                            ),
                      child: Text(
                        isTablet
                            ? "Video games & consoles"
                            : "Video games & consoles",
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                height: isTablet
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: isTablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: isTablet
                          ? EdgeInsets.only(
                              left: 10,
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
              ),
              SizedBox(
                height:
                    isTablet ? MediaQuery.of(context).size.height * 0.25 : 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.92,
                child: ListView.builder(
                  itemCount: CollectionImages.topsAndshirts.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if it's the last item (for the "See all" button)
                    if (index == CollectionImages.topsAndshirts.length) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: isTablet
                              ? MediaQuery.of(context).size.width * 0.15
                              : 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: ColorResources.borderColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorResources.normalTextColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "See all",
                                  style: TextStyle(
                                    color: ColorResources
                                        .appButtonBGColor, // Text color
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
                                style: Theme.of(context).textTheme.displayLarge,
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
      ),
    );
  }
}
