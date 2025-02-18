import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/productcategories_model.dart';
import '../utils/app-constants.dart';

class HomeController extends GetxController {
  List<ProductcategoriesModel>? productCategoryData;
  // List<dynamic> products = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getProductsData();
  }

  // void setProducts(List<dynamic> allproducts) {
  //   products = allproducts;
  //   update();
  // }

// Product Categories
  Future<void> getProductsData() async {
    isLoading = true;
    update();
    try {
      var url =
          Uri.parse('${AppConstants.baseUrl}${AppConstants.productCategories}');

      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('${AppConstants.consumerKey}:${AppConstants.consumerSecret}'))}',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          productCategoryData = List<ProductcategoriesModel>.from(
            data.map(
              (items) {
                return ProductcategoriesModel.fromJson(items);
              },
            ),
          );
        }
      } else {
        print('Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e, s) {
      print('$e,$s');
    } finally {
      isLoading = false;
      update();
    }
  }
}
