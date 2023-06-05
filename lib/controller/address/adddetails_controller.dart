import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
