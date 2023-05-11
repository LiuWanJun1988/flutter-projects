import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  PopularProductController({required this.popularProductRepository});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {

    }
  }

  void setQuantity(bool isIncrement) {
    if(isIncrement) {
      _quantity = checkQuantity(_quantity++);
    } else {
      _quantity = checkQuantity(_quantity--);
    }
    update();
  }

  int checkQuantity(int quantity){
    if(inCartItems + quantity < 0) {
      Get.snackbar(
        'Item count',
        'You can\'t reduce more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if(_inCartItems > 0) {
        _quantity = _inCartItems;
        return _quantity;
      }
      return 0;
    } else if (inCartItems + quantity > 20) {
      Get.snackbar(
        'Item count',
        'You can\'t add more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exists = false;
    exists = _cart.existsInCart(product);
    if(exists){
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if(_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
    } else {
      Get.snackbar(
        'Item count',
        'You should add at least one item to the cart!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}