import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/cart/appbarcart.dart';
import 'package:ecommerce_app/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommerce_app/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: ((controller) => BottomNavgationBarCart(
            price: "${cartController.priceorders}",
            shipping: "300",
            totalprice: "1500")),
      ),
      body: GetBuilder<CartController>(
          builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  TopAppbarCart(
                    title: 'My Cart',
                  ),
                  SizedBox(height: 10),
                  TopCardCart(
                      message:
                          "You Have ${cartController.totalcountitems} Items in Your List"),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          cartController.data.length,
                          (index) => CustomItemsCartList(
                              onAdd: () async {
                                await cartController
                                    .add(cartController.data[index].itemsId!);
                                cartController.refreshPage();
                              },
                              onRemove: () async {
                                await cartController.delete(
                                    cartController.data[index].itemsId!);
                                cartController.refreshPage();
                              },
                              name: "${cartController.data[index].itemsName}",
                              image: "${cartController.data[index].itemsImage}",
                              price:
                                  "${cartController.data[index].itemsprice} \$",
                              count:
                                  "${cartController.data[index].countitems}"),
                        )
                      ],
                    ),
                  )
                ],
              )))),
    );
  }
}
