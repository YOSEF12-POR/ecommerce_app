import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/notification/cardnotificationList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/orders/cardordersList.dart';

class NotificationSc extends StatelessWidget {
  const NotificationSc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification "),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<NotificationController>(
            builder: (((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (((context, index) => CardNotificationList(
                          listdata: controller.data[index],
                        ))))))),
          )),
    );
  }
}
