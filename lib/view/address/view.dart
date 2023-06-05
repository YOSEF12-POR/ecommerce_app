import 'package:ecommerce_app/controller/address/view_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(title: const Text('العناوين')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressadd);
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: GetBuilder<AddressViewController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return CardAddress(
                          addressModel: controller.data[i],
                          onDelete: () {
                            controller
                                .deleteAdress(controller.data[i].addressId!);
                          },
                        );
                      },
                    ),
                  )),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet!}"),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete_outline),
            ),
          )),
    );
  }
}
