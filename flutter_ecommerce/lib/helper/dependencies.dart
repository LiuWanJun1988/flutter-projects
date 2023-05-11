import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repository.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:food_delivery/data/repository/recommended_product_repository.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => CartRepository());


  Get.lazyPut(() => PopularProductController(popularProductRepository: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
}