import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/model/couponmodel.dart';
import '/core/class/statusrequest.dart';
import '/core/functions/handingdatacontroller.dart';
import '/core/services/services.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  TextEditingController? controllercoupon;
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponname;
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى  السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deletecart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من  السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print('=============');
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();

          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalecount']);
          priceorders = double.parse(dataresponsecountprice['totaleprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName!;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
      }
      // End
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
