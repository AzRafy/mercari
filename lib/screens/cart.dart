import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer.dart';

class Cart extends StatelessWidget {
  // final String productId;
  const Cart({
    super.key,
    // required this.productId,
  });

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
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenWidth * 0.04,
                  vertical: AppConstants.screenHeight * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cart',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.01,
                    ),
                    Text(
                      'Taxes will be calculated at checkout.',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.01,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          width: AppConstants.screenWidth * 0.14,
                          height: AppConstants.screenHeight * 0.14,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Asim',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      subtitle: Text(
                        '1 item',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.02,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Saving',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const WidgetSpan(
                            child: SizedBox(
                              width: 8,
                            ),
                          ),
                          TextSpan(
                            text: '\$17.21',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const WidgetSpan(
                            child: SizedBox(
                              width: 8,
                            ),
                          ),
                          TextSpan(
                            text: 'on shipping',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.03,
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.15,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index < CollectionImages.topsAndshirts.length) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
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
                          } else {
                            return buildAddMoreButton();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.screenHeight * 0.01,
                    ),
                  ],
                ),
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }

// Add more products to cart
  Widget buildAddMoreButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [3, 3],
          radius: const Radius.circular(4),
          color: Colors.grey,
          child: SizedBox(
            width: AppConstants.screenWidth * 0.4,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 24),
                  Text("Add more to\n bundle", textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
