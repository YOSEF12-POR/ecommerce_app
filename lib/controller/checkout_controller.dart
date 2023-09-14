import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";
  late String priceorders;
  late String couponid;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  Checkout() async {
    if (paymentMethod == null)
      return Get.snackbar('Error', 'Choose PaymentMethod  ');
    if (deliveryType == null)
      return Get.snackbar('Error', 'Choose DeliveryType ');

    update();
    statusRequest = StatusRequest.loading;
    Map data = {
      'usersid': myServices.sharedPreferences.getString("id"),
      'addressid': addressid.toString(),
      'orderstype': deliveryType.toString(),
      'pricedelivery': "10",
      'ordersprice': priceorders,
      'couponid': couponid,
      'paymentmethod': paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar('success', 'تم اضافة طلبك بنجاح ');
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('Error', 'حاول مرة اخرى');
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];

    getShippingAddress();
    super.onInit();
  }
}
