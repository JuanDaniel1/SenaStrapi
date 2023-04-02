import 'package:get/get.dart';
import 'package:senacomerce/controller/auth_controller.dart';
import 'package:senacomerce/controller/category_controller.dart';
import 'package:senacomerce/controller/dashboard_controller.dart';
import 'package:senacomerce/controller/home_controller.dart';
import 'package:senacomerce/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}