import 'package:ecommerce_app/data/datasource/remote/notification_data.dart';
import 'package:ecommerce_app/data/model/notificationmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List<NotificationModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getNotification() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  // refrehOrder() {
  //   getOrder();
  // }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
