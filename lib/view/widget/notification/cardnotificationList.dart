import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/data/model/notificationmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/ordesrmodel.dart';

class CardNotificationList extends GetView<NotificationController> {
  final NotificationModel listdata;
  const CardNotificationList({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${listdata.notificationTitle}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black)),
                  const Spacer(),
                  Text(listdata.notificationDatetime!,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor)),
                  // Text(
                  //   Jiffy(listdata.notificationDatetime!, "yyyy-MM-dd")
                  //       .fromNow(),
                  //   style: const TextStyle(
                  //       color: AppColor.primaryColor,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              Text("${listdata.notificationBody}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AppColor.grey)),
            ],
          )),
    );
  }
}
