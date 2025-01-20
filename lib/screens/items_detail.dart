import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mercari_app/widgets/drawer.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_searchbar.dart';

class ItemsDetail extends StatelessWidget {
  const ItemsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
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
          isTablet // Display on Tab and above
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ImageSlideshow(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      isLoop: false,
                                      indicatorBottomPadding: 30,
                                      indicatorPadding: 10,
                                      indicatorRadius: 5,
                                      children: [
                                        Image.asset(
                                          CollectionImages.itemsList[0],
                                          fit: BoxFit.cover,
                                        ),
                                        Image.asset(
                                          CollectionImages.itemsList[1],
                                          fit: BoxFit.cover,
                                        ),
                                        Image.asset(
                                          CollectionImages.itemsList[2],
                                          fit: BoxFit.cover,
                                        ),
                                        Image.asset(
                                          CollectionImages.itemsList[3],
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 20,
                                      top: 20,
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: ColorResources
                                                  .normalTextColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: const Icon(
                                              Icons.more_horiz,
                                              color:
                                                  ColorResources.appTextColor,
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 50,
                                      right: 20,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorResources.appTextColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Row(
                                          children: [
                                            Text("0"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color: ColorResources
                                                  .normalTextColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ListView.builder(
                                    shrinkWrap: false,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: ClipOval(
                                          child: Image.asset(
                                            'assets/images/user.jpg',
                                          ),
                                        ),
                                        title: Text(
                                          'James Woods',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                        subtitle: Row(
                                          children: List.generate(
                                            growable: true,
                                            6,
                                            (index) {
                                              if (index < 5) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: ColorResources
                                                      .appButtonBGColor,
                                                );
                                              } else {
                                                return const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    '437 reviews',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                  child: Container(
                                    color: ColorResources.borderColor,
                                  ),
                                ),
                                Text(
                                  'No comments...yet',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 1,
                                  child: Container(
                                    color: ColorResources.borderColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Stack(
                                    children: [
                                      const CustomSearchbar(
                                        placeholderText: 'Add your comment',
                                        fillColor: Colors.transparent,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                            color: ColorResources.borderColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: ColorResources.appTextColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.arrow_upward_sharp,
                                              color: ColorResources
                                                  .normalTextColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        child: Text(
                                          'Colsie crop top',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                      ),
                                      Text(
                                        '\$${10.0}0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              '+\$${0.55} Buyer Protection fee',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.verified_user_outlined,
                                            color:
                                                ColorResources.appButtonBGColor,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      // Custom buttons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              text: 'Make offer',
                                              bgcolor:
                                                  ColorResources.borderColor,
                                              textcolor: ColorResources
                                                  .normalTextColor,
                                              btnSize: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: CustomButton(
                                              text: 'Add to cart',
                                              bgcolor:
                                                  ColorResources.borderColor,
                                              textcolor: ColorResources
                                                  .normalTextColor,
                                              btnSize: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              textPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const CustomButton(
                                          text: 'Buy now',
                                          bgcolor:
                                              ColorResources.appButtonBGColor,
                                          textcolor:
                                              ColorResources.appTextColor,
                                          btnSize: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textPadding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/Paypal-logo-and-text.png',
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'Checkout',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                color: ColorResources
                                                    .paragraphColor,
                                                fontSize: 12,
                                              ),
                                              text:
                                                  '* By continuing to checkout, you agree to the \n',
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "Mercari Privacy Policy",
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .paragraphColor,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " and ",
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .paragraphColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Terms of Service",
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .paragraphColor,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: ColorResources.borderColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Shipping',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 60,
                                                  ),
                                                  child: Text(
                                                    '\$${5.34},',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Condition',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const Icon(
                                                  Icons.question_mark_outlined,
                                                  size: 16,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  child: Text(
                                                    'Good',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Brand',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 85,
                                                  ),
                                                  child: Text(
                                                    'Target',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Category',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const SizedBox(
                                                  width: 55,
                                                ),
                                                const Text(
                                                  'Women Tops & blouses Knit top Target Knit top',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Size',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const Icon(
                                                  Icons.question_mark_outlined,
                                                  size: 16,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 85,
                                                  ),
                                                  child: Text(
                                                    'S(4 - 6)',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Updated',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 65,
                                                  ),
                                                  child: Text(
                                                    '1 day ago',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 2,
                                        child: Container(
                                          color: ColorResources.borderColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.17,
                                        child: const Wrap(
                                          children: [
                                            Text(
                                                'Grey long sleeve cropped top with scalloped hem. Great for sleep or lounging or even out and about!\n Brand: Colsie // Size: small to medium\n'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("#croptop"),
                                                Text("#colsie"),
                                                Text("#small"),
                                                Text("#scallop"),
                                                Text("#lounge"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: ColorResources.borderColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: ListView.builder(
                                          shrinkWrap: false,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: Image.asset(
                                                'assets/images/verified_user.png',
                                              ),
                                              title: Text(
                                                'Buyer Protection',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                              ),
                                              subtitle: const Text.rich(
                                                TextSpan(
                                                  text:
                                                      'Receive your item as described, or get your money back. ',
                                                  children: [
                                                    TextSpan(
                                                      text: 'Learn More',
                                                      style: TextStyle(
                                                        color: ColorResources
                                                            .appButtonBGColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: ColorResources.borderColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Row(
                                          children: [
                                            Wrap(
                                              spacing: 15,
                                              children: [
                                                Image.asset(
                                                    'assets/images/visa.png'),
                                                Image.asset(
                                                    'assets/images/paypal.png'),
                                                Image.asset(
                                                    'assets/images/mastercard.png'),
                                                Image.asset(
                                                    'assets/images/american-express.png'),
                                                Image.asset(
                                                    'assets/images/discover.png'),
                                                Image.asset(
                                                    'assets/images/venmo.png'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: ColorResources.borderColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: isTablet
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorResources
                                                    .appButtonBGColor),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const CustomButton(
                                            text:
                                                'Have a similar item? Sell yours',
                                            bgcolor: Colors.transparent,
                                            textcolor:
                                                ColorResources.appButtonBGColor,
                                            btnSize: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textPadding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // loading...
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "More from this seller",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: isTablet ? 0 : 20,
                              ),
                              child: Text(
                                "See all",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: CollectionImages.detailItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  child: Image.asset(
                                    CollectionImages.detailItems[index]['image']
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
                                  top: isTablet ? 115 : 84,
                                  left: 4,
                                  child: Container(
                                    color: ColorResources.normalTextColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isTablet ? 25 : 15,
                                        vertical: isTablet ? 10 : 5,
                                      ),
                                      child: Text(
                                        "\$${CollectionImages.detailItems[index]["price"].toString()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
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
                  ],
                )
              // Display on mobile
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ImageSlideshow(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width,
                          isLoop: false,
                          indicatorBottomPadding: 30,
                          indicatorPadding: 10,
                          indicatorRadius: 5,
                          children: [
                            Image.asset(
                              CollectionImages.itemsList[0],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              CollectionImages.itemsList[1],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              CollectionImages.itemsList[2],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              CollectionImages.itemsList[3],
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Opacity(
                            opacity: 0.5,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: ColorResources.normalTextColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: ColorResources.appTextColor,
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.appTextColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Row(
                              children: [
                                Text("0"),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: ColorResources.normalTextColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            'Colsie crop top',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            '\$${10.0}0',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            '+\$${0.55} Buyer Protection fee',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const Icon(
                          Icons.verified_user_outlined,
                          color: ColorResources.appButtonBGColor,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Custom buttons
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: CustomButton(
                              text: 'Make offer',
                              bgcolor: ColorResources.borderColor,
                              textcolor: ColorResources.normalTextColor,
                              btnSize: Theme.of(context).textTheme.displaySmall,
                              textPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                          ),
                          // const Expanded(child: SizedBox()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: CustomButton(
                              text: 'Add to cart',
                              bgcolor: ColorResources.borderColor,
                              textcolor: ColorResources.normalTextColor,
                              btnSize: Theme.of(context).textTheme.displaySmall,
                              textPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const CustomButton(
                        text: 'Buy now',
                        bgcolor: ColorResources.appButtonBGColor,
                        textcolor: ColorResources.appTextColor,
                        btnSize: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Paypal-logo-and-text.png',
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Checkout',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              color: ColorResources.paragraphColor,
                              fontSize: 12,
                            ),
                            text:
                                '* By continuing to checkout, you agree to the \n',
                            children: [
                              TextSpan(
                                text: "Mercari Privacy Policy",
                                style: TextStyle(
                                  color: ColorResources.paragraphColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  color: ColorResources.paragraphColor,
                                ),
                              ),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(
                                  color: ColorResources.paragraphColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Shipping',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 60,
                                ),
                                child: Text(
                                  '\$${5.34},',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Condition',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Icon(
                                Icons.question_mark_outlined,
                                size: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40,
                                ),
                                child: Text(
                                  'Good',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Brand',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 85,
                                ),
                                child: Text(
                                  'Target',
                                  style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Category',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Spacer(),
                              const Text(
                                'Women Tops & blouses\n Knit top Target Knit top',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Size',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Icon(
                                Icons.question_mark_outlined,
                                size: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 85,
                                ),
                                child: Text(
                                  'S(4 - 6)',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Updated',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 65,
                                ),
                                child: Text(
                                  '1 day ago',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 2,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: const Wrap(
                        children: [
                          Text(
                              'Grey long sleeve cropped top with scalloped hem. Great for sleep or lounging or even out and about!\n Brand: Colsie // Size: small to medium\n'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("#croptop"),
                              Text("#colsie"),
                              Text("#small"),
                              Text("#scallop"),
                              Text("#lounge"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: ClipOval(
                              child: Image.asset(
                                'assets/images/user.jpg',
                              ),
                            ),
                            title: Text(
                              'James Woods',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            subtitle: Row(
                              children: List.generate(
                                growable: true,
                                6,
                                (index) {
                                  if (index < 5) {
                                    return const Icon(
                                      Icons.star,
                                      color: ColorResources.appButtonBGColor,
                                    );
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '437 reviews',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No comments...yet',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 1,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Stack(
                        children: [
                          const CustomSearchbar(
                            placeholderText: 'Add your comment',
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: ColorResources.borderColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ColorResources.appTextColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_upward_sharp,
                                  color: ColorResources.normalTextColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              'assets/images/verified_user.png',
                            ),
                            title: Text(
                              'Buyer Protection',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            subtitle: const Text.rich(
                              TextSpan(
                                text:
                                    'Receive your item as described, or get your money back. ',
                                children: [
                                  TextSpan(
                                    text: 'Learn More',
                                    style: TextStyle(
                                      color: ColorResources.appButtonBGColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 15,
                            children: [
                              Image.asset('assets/images/visa.png'),
                              Image.asset('assets/images/paypal.png'),
                              Image.asset('assets/images/mastercard.png'),
                              Image.asset('assets/images/american-express.png'),
                              Image.asset('assets/images/discover.png'),
                              Image.asset('assets/images/venmo.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: isTablet
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorResources.appButtonBGColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const CustomButton(
                          text: 'Have a similar item? Sell yours',
                          bgcolor: Colors.transparent,
                          textcolor: ColorResources.appButtonBGColor,
                          btnSize: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: ColorResources.borderColor,
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "More from this seller",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.offAll(
                              //   () => const ItemsDetail(),
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: isTablet ? 0 : 20,
                              ),
                              child: Text(
                                "See all",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 4 : 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: isTablet ? 0 : 5,
                        ),
                        itemCount: CollectionImages.detailItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.offAll(
                              //   () => const ItemsDetail(),
                              // );
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  child: Image.asset(
                                    CollectionImages.detailItems[index]['image']
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
                                  bottom: isTablet ? 15 : 0,
                                  left: 4,
                                  child: Container(
                                    color: ColorResources.normalTextColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isTablet ? 25 : 15,
                                        vertical: isTablet ? 10 : 5,
                                      ),
                                      child: Text(
                                        "\$${CollectionImages.detailItems[index]["price"].toString()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
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
                  ],
                ),
        ],
      ),
    );
  }
}
