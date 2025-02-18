import 'package:flutter/material.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/drawer.dart';

class WhishlistProducts extends StatelessWidget {
  const WhishlistProducts({super.key});

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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 7 : 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 20,
                          childAspectRatio: isTablet ? 0.8 : 0.6,
                        ),
                        itemCount: 5,
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
                                constraints: BoxConstraints(
                                  minHeight: AppConstants.screenHeight,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          //  ClipRRect(
                                          //         borderRadius:
                                          //             BorderRadius.circular(4),
                                          //         child: Image.network(
                                          //           filteredProducts[index]
                                          //               .images
                                          //               .first
                                          //               .src,
                                          //           fit: BoxFit.cover,
                                          //           width: double.infinity,
                                          //         ),
                                          //       )
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.asset(
                                              CollectionImages
                                                  .topsAndshirts[index]['image']
                                                  .toString(), // Placeholder
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: GestureDetector(
                                              onTap: () {
                                                print('Item Deleted');
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: ColorResources
                                                    .appTextBGColor,
                                              ),
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
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomButton(
                                      text: 'Add to cart', // on mobile
                                      bgcolor: ColorResources.appButtonBGColor,
                                      textcolor: ColorResources.appTextColor,
                                      btnSize: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      textPadding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return Center();
            },
          )),
    );
  }
}
