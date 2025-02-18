import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/categorybase_products_model.dart';
import '../utils/app-constants.dart';

class CategorybaseProductController extends GetxController {
  List<CategorybaseProductsModel>? categorybaseProduct;
  var isLoading = true.obs;
  var selectedCategoryId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryBaseProducts(0);
  }

  // Category Base Products
  Future<void> getCategoryBaseProducts(int categoryId) async {
    try {
      isLoading.value = true;
      selectedCategoryId.value = categoryId;
      var url = Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.categoryBaseProducts}?category=$categoryId');

      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('${AppConstants.consumerKey}:${AppConstants.consumerSecret}'))}',
        },
      );
      // print('Status Code: ${response.statusCode}');
      // print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        if (res is List) {
          categorybaseProduct = List<CategorybaseProductsModel>.from(
            res.map((items) => CategorybaseProductsModel.fromJson(items)),
          );

          if (categorybaseProduct != null && categorybaseProduct!.isNotEmpty) {
            if (selectedCategoryId.value == 0) {
              selectedCategoryId.value =
                  categorybaseProduct!.first.categories.first.id;
            }
          }
        }
      } else {
        print('Error: ${response.body}');
      }
    } catch (e, s) {
      print('$e,$s');
    } finally {
      isLoading.value = false;
      update(); // Notify the UI to refresh
    }
  }
}
