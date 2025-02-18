import 'package:get/get.dart';
import 'package:mercari_app/controllers/allproducts_controller.dart';
import 'package:mercari_app/controllers/cart_controller.dart';
import 'package:mercari_app/controllers/categorybase_product_controller.dart';
import 'package:mercari_app/controllers/home_controller.dart';

class GlobalBindings extends GetxController {
  void controllers() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AllproductsController());
    Get.lazyPut(() => CategorybaseProductController());
    Get.lazyPut(() => CartController());
  }
}
