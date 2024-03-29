import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/data/model/ordesrmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/remote/orders/pending_data.dart';
import '../../widget/orders/cardordersList.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Orders"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (((context, index) => CardOrdersList(
                          listdata: controller.data[index],
                        ))))))),
          )),
    );
  }
}
