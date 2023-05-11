import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(width: Dimensions.width20 * 5,),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  )
                ],
              )
          ),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                      builder: (cartController) {
                        return ListView.builder(
                            itemCount: cartController.getItems.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 100,
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions.width20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.getItems[index].img!
                                              )
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    Expanded(
                                        child: Container(
                                          height: Dimensions.height20 * 5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              BigText(
                                                text: cartController.getItems[index].name!,
                                                color: Colors.black54,
                                              ),
                                              SmallText(
                                                  text: 'Spicy'
                                              ),
                                              Row(
                                                children: [
                                                  BigText(
                                                    text: '\$ ${cartController.items[index]!.price!}',
                                                    color: Colors.redAccent,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: Dimensions.height10,
                                                        bottom: Dimensions
                                                            .height10,
                                                        left: Dimensions.width20,
                                                        right: Dimensions.width20
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(
                                                            Dimensions.radius20),
                                                        color: Colors.white
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () =>
                                                                popularProduct
                                                                    .setQuantity(
                                                                    false),
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,)),
                                                        SizedBox(width: Dimensions
                                                            .width10 / 2,),
                                                        BigText(
                                                            text: popularProduct
                                                                .inCartItems
                                                                .toString()),
                                                        SizedBox(width: Dimensions
                                                            .width10 / 2,),
                                                        GestureDetector(
                                                            onTap: () =>
                                                                popularProduct
                                                                    .setQuantity(
                                                                    true),
                                                            child: Icon(Icons.add,
                                                              color: AppColors
                                                                  .signColor,)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              );
                            });
                      }
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
