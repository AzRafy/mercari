import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/categorybase_products_model.dart';
import '../models/list_all_products_model.dart';
import '../utils/app-constants.dart';

class AllproductsController extends GetxController {
  List<ListAllProduct>? listOfProducts;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
  }

  // All Products
  Future<void> getAllProducts() async {
    try {
      isLoading = true;
      var url = Uri.parse('${AppConstants.baseUrl}${AppConstants.allProducts}');
      print(url);
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
          listOfProducts = List<ListAllProduct>.from(
            res.map(
              (items) {
                return ListAllProduct.fromJson(items);
              },
            ),
          );
        } else {
          print('Error: ${response.statusCode}, Body: ${response.body}');
        }
      } else {
        print('Error: ${response.body}');
      }
    } catch (e, s) {
      print('$e,$s');
    } finally {
      isLoading = false;
      update(); // Notify the UI to refresh
    }
  }
}
