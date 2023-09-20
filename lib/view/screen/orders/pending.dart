import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/data/model/ordesrmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/remote/orders/pending_data.dart';

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
            builder: (((controller) => ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (((context, index) => CardOrdersList(
                      listdata: controller.data[index],
                    )))))),
          )),
    );
  }
}

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

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
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  // Text(
                  //   Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow()
                  //   ,
                  //   style: const TextStyle(
                  //       color: AppColor.primaryColor,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      // Get.toNamed(AppRoute.ordersdetails,
                      //     arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  SizedBox(width: 10),
                  //  if (listdata.ordersStatus! == "0")
                  MaterialButton(
                    onPressed: () {
                      // controller.deleteOrder(listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Delete"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
