import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mercari_app/widgets/custom_button.dart';
import 'package:mercari_app/widgets/custom_searchbar.dart';
import 'package:mercari_app/widgets/rating_screen.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer.dart';

class FeaturedProduct extends StatefulWidget {
  const FeaturedProduct({super.key});

  @override
  State<FeaturedProduct> createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
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
            if (constraints.maxWidth < 600) {
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet
                              ? AppConstants.screenWidth * 0.04
                              : AppConstants.screenWidth * 0.03,
                          vertical: isTablet
                              ? AppConstants.screenHeight * 0.04
                              : AppConstants.screenHeight * 0.02,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/handbags.jpg',
                                fit: BoxFit.cover,
                                width: AppConstants.screenWidth * 0.3,
                              ),
                            ),
                            SizedBox(
                              width: AppConstants.screenWidth * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'product name',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    ...List.generate(
                                      5,
                                      (index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '(270 Review)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      '\$${99}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '70 % OFF',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        color: ColorResources.appButtonBGColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: ColorResources.appTextColor,
                                        size: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '14 Days return available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorResources.appButtonBGColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 5,
                        color: ColorResources.appStatusBarColor,
                        thickness: 6,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet
                              ? AppConstants.screenWidth * 0.04
                              : AppConstants.screenWidth * 0.03,
                          vertical: isTablet
                              ? AppConstants.screenHeight * 0.04
                              : AppConstants.screenHeight * 0.01,
                        ),
                        child: Text(
                          'Overall Rating',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      const Divider(
                        height: 8,
                        color: ColorResources.appStatusBarColor,
                        thickness: 2,
                      ),
                      const RatingScreen(),
                      Divider(
                        height: AppConstants.screenHeight * 0.12,
                        color: ColorResources.appStatusBarColor,
                        thickness: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: AppConstants.screenWidth * 0.03,
                              ),
                              child: CustomButton(
                                text: 'Save Address',
                                bgcolor: ColorResources.appButtonBGColor,
                                textcolor: ColorResources.appTextColor,
                                btnSize: Theme.of(context).textTheme.labelSmall,
                                textPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              );
            }
            // On Tablet
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet
                    ? AppConstants.screenWidth * 0.04
                    : AppConstants.screenWidth * 0.03,
                vertical: isTablet
                    ? AppConstants.screenHeight * 0.04
                    : AppConstants.screenHeight * 0.02,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/handbags.jpg',
                                fit: BoxFit.cover,
                                width: isTablet
                                    ? AppConstants.screenWidth * 0.18
                                    : AppConstants.screenWidth * 0.3,
                              ),
                            ),
                            SizedBox(
                              height: AppConstants.screenHeight * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'product name',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    ...List.generate(
                                      5,
                                      (index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '(270 Review)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      '\$${99}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '70 % OFF',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        color: ColorResources.appButtonBGColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: ColorResources.appTextColor,
                                        size: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '14 Days return available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorResources.appButtonBGColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.screenWidth * 0.04,
                          ),
                          child: Text(
                            'Overall Rating',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        const RatingScreen(),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppConstants.screenWidth * 0.04,
                                ),
                                child: CustomButton(
                                  text: 'Save Address',
                                  bgcolor: ColorResources.appButtonBGColor,
                                  textcolor: ColorResources.appTextColor,
                                  btnSize:
                                      Theme.of(context).textTheme.labelSmall,
                                  textPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
