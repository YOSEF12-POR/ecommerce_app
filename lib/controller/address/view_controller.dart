import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  late StatusRequest statusRequest;
  deleteAdress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
