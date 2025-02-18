import 'package:get/get.dart';

class CartController extends GetxController {
  var isAddedToCart = false.obs;

  void addToCart() async {
    isAddedToCart.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isAddedToCart.value = false;
  }
}
