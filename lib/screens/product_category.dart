import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/color_resources.dart';
import '../widgets/collection_images.dart';
import '../widgets/custom_searchbar.dart';
import '../widgets/drawer.dart';
import 'product_subcategory.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.off(
                  () => const ProductSubcategory(),
                );
              },
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        CollectionImages.productCategory[index]['image']
                            .toString(),
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(CollectionImages.productCategory[index]['title']
                        .toString()),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  );
                },
                itemCount: CollectionImages.productCategory.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: ColorResources.borderColor,
                  );
                },
              ),
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
